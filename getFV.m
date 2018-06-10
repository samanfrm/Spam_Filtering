function [ output ] = getFV( data )

FV={};
for i=1:size(data,1)
    split1= regexp(data{i,2},'\s','split');
    FV=horzcat(FV,split1);
    
end
output=unique(lower(FV));
