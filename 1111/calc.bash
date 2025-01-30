#!/usr/bin/bash
echo $((1+2+3+4+5+6+7+8+9+10))

factorial()
{
	local param=$1;
	if((param==1));then
		echo "1";
	else
		echo $((param*$(factorial $((param-1)))))
	fi
}

echo $(($(factorial $((7+3-1)))/($(factorial "3")*$(factorial $((7-1))))))

echo $((2**31-1))
