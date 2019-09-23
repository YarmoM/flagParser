function [S args] = flagParser(args, flags)
%FLAGPARSER Parse varargin for flags (BEFORE INPUTPARSER)
%   [S args] = flagParser(args, flags) parses the cell array args,
%   checking for any flags provided in the cell array flags, then returns
%   the args without the flags so they can be processed in inputParser and
%   the struct S, containing all the booleans specifying the absence or
%   presence of the flags in the args.
%
%   Please provide the flags without the leading dash.
    
    % Convert input to cell array if needed
    if ischar(flags)
        flags = {flags};
    end
    
    % tempFlags has a dash prepended to all flags
    tempFlags = cellfun(@(x)(['-' x]), flags, 'UniformOutput', false);
    
    % tempArgs contains only strings
    tempArgs = cellfun(@num2str, args, 'UniformOutput', false);

    % Check for every potential flag
    [hasFlags idxFlag] = ismember(tempFlags, tempArgs);
    
    % Make the output struct S
    S = cell2struct(num2cell(hasFlags), flags, 2);
    
    % Remove the flags from the args (compatible with inputParser)
    args(idxFlag(hasFlags)) = [];

end
