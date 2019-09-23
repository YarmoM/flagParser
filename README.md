# flagParser

Parse varargin for flags

## Usage

[S args] = flagParser(args, flags) parses the cell array args, checking for any flags provided in the cell array flags, then returns the args without the flags so they can be processed in inputParser and the struct S, containing all the booleans specifying the absence or presence of the flags in the args.

Please provide the flags without the leading dash.