function [v_output,v_out_in_bits] = successive_app_adc(number_of_bits,v_ref,v_input)

v_out_in_bits = [1 zeros(1,number_of_bits-1)];
quantization_levels = [v_ref./(2.^(1:number_of_bits))];
comparator=sum(v_out_in_bits.*quantization_levels);

%checking negative input
if v_input<0
    warning('Input voltage should be positive,output is forced to be zero automatically,please try again.');
    v_output=0;
    v_out_in_bits=zeros(1,number_of_bits);
%checking out of range input
else if v_input>=v_ref
    v_out_in_bits=ones(1,number_of_bits);
    v_output=sum(v_out_in_bits.*quantization_levels);

%input in the range
else
    for i=1:number_of_bits       
        if i==number_of_bits
            if v_input>=comparator
                v_out_in_bits(i)=1;
                comparator = sum(v_out_in_bits.*quantization_levels);
                break
            else if v_input<comparator
                v_out_in_bits(i)=0;
                comparator = sum(v_out_in_bits.*quantization_levels);
                break
            end 

            end
            
        end
        
        if v_input>=comparator
            v_out_in_bits(i)=1;
            v_out_in_bits(i+1)=1;
            comparator = sum(v_out_in_bits.*quantization_levels);
        else if v_input<comparator
            v_out_in_bits(i)=0;
            v_out_in_bits(i+1)=1;
            comparator = sum(v_out_in_bits.*quantization_levels);
        end 

        end
        end
        v_output=sum(comparator);

end
end
end

