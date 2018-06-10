function [ output ] = test1SMS( sms,model )

    
    array= rmstops(sms);
    array= regexp(array,'\s','split');
    %testing for ham...
    sum1=0;
    for i=1:size(array,2)
       index=find(strcmp(model.FV ,array(i))== 1);
       if(~isempty(index))
          sum1=sum1+log(model.probab(1,index+3));
       end
    end
     %testing for spam...
    sum2=0;
    for i=1:size(array,2)
       index=find(strcmp(model.FV ,array(i))== 1);
       if(~isempty(index))
          sum2=sum2+log(model.probab(2,index+3));
       end
    end
    
    if(sum1>sum2)
       output='ham'; 
    else
        output='spam';
    end
    
end

