---
title: Chapter 9
date: 2023-11-10
---

<html>
	<head>
	    <!-- Include MathJax script -->
		<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
		<!-- Google tag (gtag.js) -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=G-SF6SRSNGQF"></script>
		<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());
		gtag('config', 'G-SF6SRSNGQF');
		</script>
	</head>
	<a style="margin-bottom:5px" href="/cpu_tutorial">< Go Back</a>
	<p></p>
</html>

# Chapter 09 - Arithmetic Logic Unit (ALU) -- ROUGH DRAFT (EDITS COMING)
**Topics Covered:** ALU

Now that we understand some of the funamentals of how numbers and logic are represented in the computer world, I think it is time we broaden our knowledge by introducing the Artithemtic Logic Unit, ALU. 

### What is an ALU?

ALU can simply be defined as a circuit which allows us to perform arithmetic and logical operations using binary numbers. The ALU is where all of the processing in a computer occurs (so you can think of it as the main unit in the computer). You might have heard of the Central Processing Unit, or CPU, being called the "brains of the computer". Technically speaking, in modern computing, the ALU is actually a component that is part of the CPU. However, for our purposes, we are going to keep it simple and learn about the ALU first. ALUs are actually one of the oldest concepts in computer science and were originally suggested by John von Neumann in 1945, so a lot of older computers actually have basic implementations of ALUs and the only thing they could do was simple arithmetic and logical operations!

You might be asking yourself how is an ALU different than a Ripple Carry Adder, an Adder-Subtractor, etc. An ALU allows us to perform more than just adding and subtracting as we will get into below.

So we have defined what an ALU is, you might now be wondering what it consists of? I think it would be helpful to break it down into three simple parts: the input, the opcode, and the output. Let's try to define what each of these parts are and how they function:

* Input: The input is what you think it probably is. The ALU will take in two binary operands (integers only) and we can define both of these to be n bits (they should equal the same length). Simple right?  
* Opcode: This is where the ALU gets interesting and relates to what makes an ALU different than what we have already learned. The opcode is an m-bit input into the ALU which allows us to execute different operations depending on the combination. So a 1-bit opcode will allows us to perform 2 various operations, 2-bit opcode will allow us to perform 4 various operations, a 3-bit opcode will allow us to perform 8 bit operations, a 4-bit opcode will allow us to perform 16 operations, and so on. As you can see, the general rule we follow for determining the number of operations we perform based on an n-bit opcode is $$2^n$$. So you might be wondering what these operations consist of. The opcode can essentially define various arithemtic operations such as addition, subtraction, incrementing, and decrementing; bitwise logical operations such as AND, OR, XOR, One's Complement; and, bit shift operations such logical shift or arithmetic shift. For our purposes, we will start out building an ALU with 4 different operations (add, subtract, AND, and shifting). Moreover, the ALU also calculates the result for all of these different operations at one time after the inputs get fed in, and then the opcode is used to select the output that we desire (this will make more sense as we start building our ALU).
* Output: Lastly, we have the output. This just represents the result of our operation. We can also have other flags from our calculation such as a carry flag which specifies if there was carry-over (which is only used in unsigned arithmetic), overflow flag which specifies if there was an overflow (which is only used in signed arithmetic), zero flag which specifies if the actual result was 0, and negative flag which specifies if the result was negative.

#### Bitwise Operations

In our explantion of an opcode, we came across a term: bitwise. Bitwise operations basically perform any logical operation (such as AND, OR, NOT) on each corresponding bit when given two n-bit binary values. So let's take a simple example. If we were to perform an AND operation on **1111** (Nibble A) and **1010** (Nibble B), here is how that would look like:

| | Bit #4 | Bit #3 | Bit #2 | Bit #1 | 
|:--:|:--:|:--:|:--:|:--:|
| Nibble A | 1 | 1 | 1 | 1 |
| Nibble B | 1 | 0 | 1 | 0 |
| Result | 1 | 0 | 1 | 0 |

Notice how we perform an AND on each place value or each corresponding bit. This same idea applies to the other bitwise operations also. 

Below is a circuit that represents how to perform the AND bitwise operation on two 4-bit binary values (we use the same inputs and values as the above example):

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/Bitwise_AND.png" style="display: block; margin-left: auto; margin-right: auto;" />

#### Bit Shift Operations

We also ran into another term that didn't seem familar: bit shift. Bit shift operations are essentially a way to multiply or divide the number by 2. Say you were presented a binary value of $$0110_{2}$$ (which is $$6_{10}$$). If we shifted all the bits to the left by 1, it would become $$1100_{2}$$ (or $$12_{10}$$). Now, let's try the opposite and shift the original value of $$0110_{2}$$ to the right. Now, this would become $$0011_{2}$$ (or $$3_{10}$$). Cool right! So, it turns out shifting the digits to the left means that we are multiplying the number by 2 and shifting the digits to the right means we are dividing by 2. However, depending on if we are dealing with unsigned or signed numbers, the bit shift operations behave a bit differently.

With unsigned binary values, we use the  **logical bit shift**. Below are two explanations on how to perform a left logical shift and a right logical shift respectively:
* When we perform a left logical shift, each bit is shifted to the left by one position, the LSB is replaced by a 0, and the original MSB is removed. So, if we had the byte $$01100101_{2}$$, and we performed a left logical shift, our result would be $$11001010_{2}$$. Our original byte had the numerical value of $$101_{10}$$. After our left logical shift, the value of our byte is multiplied by 2 meaning it's value is $$202_{10}$$.  
* Now, let's look at how to perform a right logical shift. When we perform a right logical shift, each bit is shifted to the right by one position, the MSB is replaced by a 0, and the original LSB is removed. Let's use the same byte we used in the example above: $$01100101_{2}$$. After we perform the right logical shift, our byte becomes $$00110010_{2}$$ and has a value of $$50_{10}$$. 

Now that we understand how to use the logical bit shift, let's take a look at the **arithmetic bit shift**. We use the arithmetic bit shift when working with signed binary values (in other words, two's complement numbers). Below are two explanations on how to perform a left arithmetic shift and a right arithmetic shift:
* When we perform a left arithmetic shift, we are doing the same thing as we did with the left logical shift. Essentially, each bit is shifted to the left by one position, the LSB is replaced by a 0, and the original MSB is removed. Let's go through another example. Suppose we have the byte $$00010101_{2}$$ (can also be represented as $$21_{10}$$). When we perform a left arithmetic shift, our byte becomes $$00101010_{2}$$ (which is $$42_{10}$$). Simple right?
* The right arithmetic shift is a little harder. Depending on the value of the MSB, we insert the same value bit. So, if the MSB is equal to 1, then we insert a 1 and if the MSB is equal to 0, then we insert a 0. After inserting in the proper bit into the MSB, we shift all the original bits to the right by 1, and remove the original LSB. Let's look at a quick example. If we had the byte $$11001100_{2}$$ (which is equivalent to $$-52_{10}$$) and performed a right arithmetic shift, the result would be the byte $$11100110_{2}$$ (which is equivalent to $$-26_{10}$$).

*Aside: When performing division on an odd number, you might notice that the result is a decimal. However, with the right bit shift (logical or arithmetic), the binary result is equivalent to the floor of the decimal result. For example, if we had the number $$01010101_{2}$$ ($$85_{10}$$) and we performed a right shift operation, then the result is $$00101010_{2}$$ ($$42_{10}$$).*

*Aside: If we shift by multiple bits, then we are multiplying or dividing the original value by $$2^n$$ where n is the number of digits we shift by. For example, if we had the number $$01100110_{2}$$ ($$102_{10}$$) and performed a right shift by 3 bits, the result would be $$00001100_{2}$$ {$$12_{10}$$}. To break it down further: $$102/(2^3)$$ --> $$102/8$$ --> $$12.75$$ which is $$12_{10}$$ rounded down (or floored).*

As mentioned in the above section, our ALU will contain the logic to perform a shift left operation (since logical and arithmetic shift left work the same way, we are just going to call it shift left). In order to do so, let's revisit some of the key ideas of how a shift left operation works:
* The first key idea is that the LSB will be replaced by a 0.
* Every bit will move to the left by 1.
* The MSB will be removed.
Now, that we understand those three key principles, let's go ahead and build our circuit (we will be building a 4-bit shift left circuit):

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/Shift_Left_1.png" style="display: block; margin-left: auto; margin-right: auto;" />

Let's break this circuit down and think about this intuitively:
* The first thing that I would like to point out every output is the result of two AND gates OR'd together. 
	* The first AND gate (on the right) takes the input of the bit to it's left and the Shift Left input (for Y1, the first AND gate takes the input of A0 and the Shift Left input). The second AND gate takes the input of the corresponding input bit and the inverted value of the Shift Left input (for Y1, the second AND gate takes the input of A1 and the inverted value of Shift Left). Essentially, the first AND gate is responsible for calculating the result bit when we are shifting left and the second AND gate is responsible for calculating  the result when we are **not** shifting left. Think about it for a second.
		* Looking at the first AND gate, this AND gate will only output the right result when Shift Left is on (the second AND gate will always be 0 since it's passing the inverted Shift Left input signal); and, looking at the second AND gate, this AND gate will only output the right result when the Shift Left is off (the first AND gate will always be off since it is not receiving a signal from the Shift Left input). Essentially, only one of the AND gates will have a valid signal at a given time and that means the input from the corresponding bit or the input from the bit to left is passed through.
	* The result of both the AND gates is OR'd together to output a value for the bit. Since one of the AND gates will always output a 0, the result is dependent on whatever the result of the other AND gate is. For example, looking at the subsection for the Y1 output and we say A0 is 1 and A1 is 0. If the Shift Left input is on, then it means the second AND gate is turned off and the first AND gate is turned on and since A0 is 1, then we will get an output of 1 (0 OR'd with 1 is 1). But, if the Shift Left input is off, then it means the first AND gate is turned off and the second AND gate is turned on and since A1 is 0, then we will get an output of 0.

Now that the explanation makes some sense, here is an example of the circuit with the input being $$0011_{2}$$ (one image shows the Shift Left input being off and another image shows the Shift left being on):

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/Shift_Left_2.png" style="display: block; margin-left: auto; margin-right: auto;" />
<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/Shift_Left_3.png" style="display: block; margin-left: auto; margin-right: auto;" />

### 1-bit ALU

As you can tell, the ALU has many different parts to it, so we are going to build it one step at a time. First, we are going to start out by building a 1-bit ALU to actually understand how the ALU processes information. Again, our ALU is going to be responsible for 4 different things: adding, subtracting, performing AND logic and performing a XOR logic.

*Aside: I know it doesn't make much sense to only have a 1-bit ALU (because what computer only does operations on 1 bit of information). However, take this example with a grain of salt. We want to explore more of how the data flows through the ALU compared to the analyzing the actual result of the ALU (we will study this part in the later part of the chapter when we build a 4-bit ALU).*

The first step in building this 1-bit ALU is building out some of the logic. We spent the last two chapters discussing how to build an Adder-Subtractor circuit. We can use that knowledge here to build a one-bit Adder-Subtractor circuit to perform two of the four operations we need (adding and subtracting). Below is a circuit that represents a 1-bit Adder-Subtractor:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/1-bit_ALU_1.png" style="display: block; margin-left: auto; margin-right: auto;" /> 

Notice how in the image above, we technically already have a 1-bit opcode (the A/S bit) choosing between two different operations (addition and subtraction). 

Next, we can also add further logic to our circuit by implementing the AND logic.  

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/1-bit_ALU_2.png" style="display: block; margin-left: auto; margin-right: auto;" /> 

Notice how we are seperating the logic for the Adder/Subtractor and the AND gate. The ALU will now perform the calculations for both the Adder/Subtractor and AND gate seperately. Let's not worry too much about the inputs and outputs of the logic, but in this image below, notice how the logic for the Adder/Subtractor and AND gate is being calculated seperately:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/1-bit_ALU_3.png" style="display: block; margin-left: auto; margin-right: auto;" /> 

Alright, now we want to add the last piece of logic to our ALU which is shifting left. Again, since this is a 1-bit example, don't worry about the inputs and outputs, worry about how the logic flows. In our ALU, when we perform the left shift, we will only be performing it on Input A and ignore Input B. Usually in computer architecture, when we performing shifting operations, we shift the value of Input A by a specified amount of bits; however, for our use case, we will keep it simple. 

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/1-bit_ALU_4.png" style="display: block; margin-left: auto; margin-right: auto;" /> 

Notice how in the image above, we have a completely different logical section for performing calculations using the XOR gate. This behaves in the same way that the AND gate does essentially.

Now that we have all the logical components of our ALU in place, it is time to understand how the ALU chooses the correct output based on the operand we provide. In any given scenario, the ALU will be given two inputs, it will calculate the output as shown in the image for all of the possible scenarios, and then we provide the ALU another input (called the operand) to select the output we desire based on what operation we want the ALU to complete. So if we wanted the ALU to perform the bitwise AND operation, the ALU will also complete calculations for adding/subtracting and the bitwise XOR operation, and based on the operands provided, it will select the result of the bitwise AND operation. You're probably asking what is the purpose of doing all the calculations if we just select the result of one of them at the end. In our situation, we are just trying to demonstrate what the ALU is doing without the thought of efficiency to keep it as simple as possible for now (modern computers are much more efficient). In the image below, we have implemented the operands into the circuit:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/1-bit_ALU_5.png" style="display: block; margin-left: auto; margin-right: auto;" /> 

Let's walk through this. The first operand is responsible for selecting whether to do addition or subtraction AND selecting whether to choose the result from the bitwise AND operation or the bitwise XOR operation. So for example, if we wanted to do addition, the first operand would be turned off (0), so the result of the addition logic and bitwise XOR logic would be inputted into the final multiplexor. Then, the second operand will choose between the addition logic and bitwise XOR logic. And since we want to do addition with our ALU, the second operand would be turned on (1) ouputting the result of the addition. Let's look at a truth table and trace the logic using that:

| Operation Performed | Operand 1 | Operand 2 |
|:--:|:--:|:--:|
| XOR | 0 | 0 |
| AND | 1 | 0 |
| Addition | 0 | 1 |
| Subtraction | 1 | 1 |

Congrats! You just built your first ALU!

### Multi-Bit ALU

Now that we understand how the logic flows in an ALU, it's time to build a multi-bit ALU (which will make a lot more sense if we want to do calculations)! More specifically, we will be creating a 4-bit ALU. Before we dive into creating the 4-bit ALU, there are some small changes we will make to our 1-bit ALU in order for it to work with 4 bits:

* The first change we will make is to bring back the 4-bit Adder-Subtractor instead of using a 1-bit Adder-Subtractor. And instead of using the entire circuit we can instead use an IC (which was introduced at the end of Chapter 6). We can abstract the complex circuitry we built using the 7483 Full Adder IC. Keep in mind that this circuit is just a 4-bit Ripple Carry Adder, and we still need to invert the A input and add 1 to the carry-in to make it into an Adder-Subtractor. I have included an image of the 7483 IC below:
	* <img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/7483.png" style="display: block; margin-left: auto; margin-right: auto;" /> 
		* This IC has multiple inputs/outputs, let me quickly describe what each does to you. The A1, A2, A3, A4 inputs are for responsible for receiving the A input; the B1, B2, B3, B4 inputs are responsible for receiving the B input; the S1, S2, S3, S4 are responsible for outputting the sum of the addition/subtraction; C4 is the final carry-out; C0 is the initial carry-in (to signal whether we are performing addition or subtraction); and the VCC and GND are the power and ground respectively. 
* Next, we will include 4 AND gates and 4 XOR gates instead of just 1 AND gate and 1 XOR gate since we now how 4 bits for each of the two inputs and need to perform bitwise operations on each corresponding bit.
* Finally, the last major change our 4-bit ALU will have is we will be increasing the number of multiplexors used to account for the extra bits. For example, notice in our diagram of the 1-bit ALU, we use one multiplexor to choose between the AND and XOR logic. In our 4-bit ALU, we need to use four multiplexors (one multiplexor to choose between each corresponding bit). For example, we need one multiplexor each for the ouput for the first, second, third, and fourth bit. 
	* We also need to increase the number of multiplexors when displaying our final output where we choose between displaying the result of the addition/subtraction and the AND/OR bitwise logic.

Now that we have read through the changes, let's build out 4-bit ALU:
<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/4-bit_ALU_1.png" style="display: block; margin-left: auto; margin-right: auto;" /> 

Keep in mind the same operand inputs apply that we went looked at when we built the 1-bit ALU. 

The last part to building our ALU is creating the flags: carry, overflow, zero, negative. Here is how we build each one of these flags:
* Negative: This indicates whether our result was negative and we can use the MSB (Y3) to toggle this flag.
* Zero: This indicates whether the result is 0 and is an inverted OR gate. This makes sense because we want all of the bits to be turned off and the output of an inverted OR gate will only ever be on if all the inputs are off. 
* Carry: This indicates whether we have a carry from our addition operations (only used in unsigned addition) and is just the ouput of C4 from the 7483 IC we use.
* Overflow: This indicates that our output is out of range and cannot be represented by the number of bits we have (for signed operations). The overflow is on when we are adding two positive numbers and the result is negative OR if we are adding two negative numbers and the result is positive (remember, we can check whether an input/output is positive or negative by using the MSB). So in order to build an overflow flag, we can use the equation $$A_{3}B_{3}\overline{Y_{3}+\overlineA_{3}\overlineB_{3}{Y_{3}}$$. The first side of this equation checks if input A and B are both negative, the MSBs have the value of 1, and the ouput is positive, the MSB has the value of 0 (which it flips to 1 with the NOT symbol to make the AND gate true and indicate there is an overflow). The second side of the equation does the vice versa. It checks that the ouput is negative, the MSB has a value of 1, and input A and B are both positive, the MSBs have the value of 0 (which it flips to 1 with the NOT symbol to make the AND gate true and indicate there is an overflow).

Here is our finished ALU below:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/4-bit_ALU_2.png" style="display: block; margin-left: auto; margin-right: auto;" /> 

Congrats! We finished building our 4-bit ALU. I highly encourage you to download the Digital file and play around with the ALU to ensure you really understand how it works. Try modifying it too! In the later sections, we are going to be looking at and building some more components which are important to how a computer processes and stores information. 