#!/usr/bin/env python3
import sys
import re
import argparse


func_pattern = re.compile(r"""---@field\s+[^\s]*\s+fun\([^\)]*\).*""")

name_and_args_pattern = re.compile(r"""---@field\s+(?P<function_name>[^\s]*)\s+fun\((?P<function_arguments>[^\)]*)\)""")

split_args_pattern = re.compile(r"""(?P<name>[^\s,]*)\s*:\s*(?P<type>[^,]*)""")

return_type_pattern = re.compile(r"""---@field\s+[^\s]*\s+fun\([^\)]*\)\s*:\s*(?P<return_type>.*)""")

sanitize_pattern = re.compile(r"""[^a-zA-Z0-9_]""")


def main(argv: list[str]):
	parser = argparse.ArgumentParser()
	parser.add_argument("-p", "--prefix", help="Prefix to prepend onto each function name", default="")
	parser.add_argument("-s", "--suffix", help="Suffix to apppend onto each function name", default="")
	parser.add_argument("-i", "--in-place", action="store_true", help="Write output back into FILE instead of printing ", default="")
	parser.add_argument("file", help="The file to extend")
	args = parser.parse_args(argv)

	text = ""

	with open(args.file) as f:
		text = f.read()

	out = ""

	#for func in re.findall(func_pattern, text):
	for line in text.splitlines():
		if not re.match(func_pattern, line):
			out += line + "\n"
			continue

		return_type = None
		if re.match(return_type_pattern, line):
			return_type = re.findall(return_type_pattern, line)[0]
			line = re.sub(r"""^.*?\s*:\s*""", "", line[::-1])[::-1]

		function_name, function_args = re.findall(name_and_args_pattern, line)[0]
		args_dict: dict[str, str] = dict(re.findall(split_args_pattern, function_args))

		docstring = "".join(f"""---@param {name} {type}\n""" for name, type in args_dict.items())

		args_list: list[str] = list(args_dict.keys())
		for i, arg in enumerate(args_list):
			args_list[i] = re.sub(sanitize_pattern, "", arg)

		if return_type:
			docstring += f"""---@return {return_type}\n"""

		func_fmt = f"""--- ## {args.prefix}{function_name}{args.suffix}\n--- \n{docstring}function {args.prefix}{function_name}{args.suffix}({", ".join(args_list)}) end\n\n"""
		out += func_fmt

	out = out.strip() + "\n"
	if args.in_place:
		with open(args.file, "w") as f:
			f.write(out)
	else:
		print(out)


if __name__ == "__main__":
	main(sys.argv[1:])
