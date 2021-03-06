% Copyright (C) 2015 Tinotenda Chemvura
% 
% This program is free software; you can redistribute it and/or modify it
% under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

% -*- texinfo -*- 
% @deftypefn {Function File} {@var{retval} =} makeFrames (@var{input1}, @var{input2})
%
% @seealso{}
% @end deftypefn

%Author: Tinotenda Chemvura @tino1b2be
%Created: 2015-12-05

function sequence = getDTMFSequence( rawKeys )
%Function to retrieve the actual sequence of DTMF tones represented by the
%data. The input is the data from the getRawKeys() function which will be a
%string representing the DTMF character from each frames

    % go through the whole string, if the current char is not a "_",
    % add that char to the output sequence and skip to the next "_"
    % char
    
    sequence = '';
    if (rawKeys(1) ~= '_')
        sequence = rawKeys(1);
    end
    for i = 2 : length(rawKeys)
        if (rawKeys(i) == '_' && rawKeys(i-1) ~= '_')
            sequence = strcat(sequence,' ');
        elseif (rawKeys(i) ~= rawKeys(i-1))
            sequence = strcat(sequence,rawKeys(i));
        end
    end %end of for loop
end %end of function

