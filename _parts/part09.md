---
title: Chapter 8
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

# Chapter 09 - Arithmetic Logic Unit (ALU)
**Topics Covered:** ALU

Now that we understand some of the funamentals of how numbers and logic are represented in the computer world, I think it is time we broaden our knowledge by introducing the Artithemtic Logic Unit, ALU. 

### What is an ALU?

ALU can simply be defined as a circuit which allows us to perform arithmetic and logical operations using binary numbers. The ALU is where all of the processing in a computer occurs (so you can think of it as the main unit in the computer or the brains). You might have heard the Central Processing Unit, or CPU, being called the brains of the computer. Technically speaking, in modern computing, the ALU is actually a circuit that is part of the CPU. However, for our purposes, we are going to keep it simple and learn about the ALU first. ALUs are actually one of the oldest concepts in computer science and were originally suggested by John von Neumann in 1945, so a lot of older computers actually have basic implementations of ALUs and the only thing they could do was simple arithmetic and logical operations!

So we have defined what an ALU is, you might now be wondering what it consists of? I think it would be helpful to break it down into three simple parts: the input, the opcode, and the output. Let's try to define what each of these parts are and how they function:

* Input: The input is what you think it probably is. The ALU will take in two binary operands (integers only) and we can define both of these to be N bits. Simple right?  
* Operands: This is where the ALU gets interesting. The operand is an n-bit input into the ALU which allows us to execute different operations depending on the combination. So a 2-bit operand will allow us to perform 4 various operations, a 3-bit operand will allow us to perform 8 bit operations, a 4-bit operand will allow us to perform 16 operations, and so on. As you can see, the general rule we follow for determining the number of operations we perform based on an n-bit input is $$2^n$$. So you might be wondering what these operations consist of. The operand can essentially define various arithemtic operations such as addition, subtraction, incrementing, and decrementing; bitwise logical operations such as AND, OR, XOR, One's Complement; and, bit shift operations. For our purposes, we will start out building an ALU with 4 different operations (add, subtract, AND, and shift left). Moreover, the ALU also calculates the result for all of these different operations at one time after the inputs get fed in, and then the operands are used to select the output that we desire (this will make more sense as we start building our ALU).
* Output: Lastly, we have the output. This just represents the result of our operation. We can also have other outputs from our calculation such as a carry flag which specifies if there was carry-over (which is only used in unsigned arithmetic), overflow flag which specifies if there was an overflow (which is only used in signed arithmetic), zero flag which specifies if the actual result was 0, and negative flag which specifies if the result was negative.

#### Bitwise Operations

In the second bullet point in the explanation of what an ALU consists of, we came across a term: bitwise. Bitwise operations basically perform any logical operation (such as AND, OR, NOT) on each corresponding bit when given two N-bit binary values. So let's take a simple example. If we were to perform an AND operation on **1111** (Nibble A) and **1010** (Nibble B), here is how that would look like:

| | Bit #4 | Bit #3 | Bit #2 | Bit #1 | 
|:--:|:--:|:--:|:--:|:--:|
| Nibble A | 1 | 1 | 1 | 1 |
| Nibble B | 1 | 0 | 1 | 0 |
| Result | 1 | 0 | 1 | 0 |

Notice how we perform an AND on each place value or each corresponding bit. This same idea applies to the other bitwise operations also. 

Below is a circuit that represents how to perform the AND bitwise operation on two 4-bit binary values (we use the same inputs - Nibble A and Nibble B):

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/Bitwise_AND.png" style="display: block; margin-left: auto; margin-right: auto;" />

#### Bit Shift Operations

We also ran into another term that didn't seem familar: bit shift. Bit shift operations are essentially a way to multiply or divide the number by 2. Say you were presented a binary value of $$0110_{2}$$ (which is $$6_{10}$$). If we shifted all the bits to the left by 1, it would become $$1100_{2}$$ (or $$12_{10}$$). Now, let's try the opposite and shift the original value of $$0110_{2}$$ to the right. Now, this would become $$0011_{2}$$ (or $$3_{10}$$). Cool right! So, it turns out shifting the digits to the left means that we are multiplying the number by 2 and shifting the digits to the right means we are dividing by 2. However, depending on if we are dealing with unsigned or signed numbers, the bit shift operations behaves a bit differently.

With unsigned binary values, we use the  **logical bit shift**. Below are two explanations on how to perform a left logical shift and a right logical shift respectively:
* When we perform a left logical shift, we insert the 0 bit into the LSB position and shift all the bits to the left by one spot. So, if we had the byte $$01100101_{2}$$, and we performed a left logical shift, our result would be $$11001010_{2}$$. Our original byte had the numerical value of $$101_{10}$$. After our left logical shift, the value of our byte is multiplied by 2 meaning it's value is $$202_{10}$$.  
* Now, let's look at how to perform a right logical shift. When we perform a right logical shift, we insert the 0 bit into the MSB position and shift all the bits to the right by one spot. Let's use the same byte we used in the example above: $$01100101_{2}$$. After we perform the right logical shift, our byte becomes $$00110010_{2}$$ and has a value of $$50_{10}$$. 

Now that we understand how to use the logical bit shift, let's take a look at the **arithmetic bit shift**. We use the arithmetic bit shift when working with signed binary values (in other words, two's complement numbers). Below are two explanations on how to perform a left arithmetic shift and a right arithmetic shift:
* When we perform a left arithmetic shift, we are doing the same thing as we did with the left logical shift. Essentially, we shift each bit to the left by 1 and insert a 0 for the LSB. Let's go through another example. Suppose we have the byte $$00010101_{2}$$ (can also be represented as $$21_{10}$$). When we perform a left arithmetic shift, our byte becomes $$00101010_{2}$$ (which is $$42_{10}$$). Simple right?
* The right arithmetic shift is a little harder. Depending on the value of the MSB, we insert the same value bit. So, if the MSB is equal to 1, then we insert a 1 and if the MSB is equal to 0, then we insert a 0. After inserting in the proper bit into the MSB, we shift all the bits to the right by 1. Let's look at a quick example. If we had the byte $$11001100_{2}$$ (which is equivalent to $$-52_{10}$$) and performed a right arithmetic shift, the result would be the byte $$11100110_{2}$$ (which is equivalent to $$-26_{10}$$).

*Aside: When performing division on an odd number, you might notice that the result is a decimal. However, with the right bit shift (logical or arithmetic), the binary result is equivalent to the floor of the decimal result. For example, if we had the number $$01010101_{2}$$ ($$85_{10}$$) and we performed a right shift operation, then the result is $$00101010_{2}$$ ($$42_{10}$$).*

*Aside: If we shift by multiple bits, then we are multiplying or dividing the original value by $$2^n$$ where n is the number of digits we shift by. For example, if we had the number $$01100110_{2}$$ ($$102_{10}$$) and performed a right shift by 3 bits, the result would be $$00001100_{2}$$ {$$12_{10}$$}. To break it down further: $$102/(2^3)$$ --> $$102/8$$ --> $$12.75$$ which is $$12_{10}$$ rounded down (or floored).*

As mentioned in the above section, our ALU will contain the logic to perform a shift left operation (since logical and arithmetic shift left work the same way, we are just going to call it shift left). In order to do so, let's revisit some of the key ideas of how a shift left operation works:
* The first key idea is that the LSB will be replaced by a 0.
* Every bit will move to the left by 1.
* The MSB will be discarded.
Now, that we understand those three key principles, let's go ahead and build our circuit (we will be building a 4-bit shift left circuit):

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/Shift_Left_1.png" style="display: block; margin-left: auto; margin-right: auto;" />

Let's break this circuit down and think about this intuitively:
* The first thing that I would like to point out every output is the result of two AND gates OR'd together. 
	* The first AND gate (on the right) takes the input of the bit on the left and the Shift Left input (for Y1, the first AND gate takes the input of A0 and Shift Left). The second AND gate takes the input of the corresponding input bit and the inverted value of the Shift Left input (for Y1, the second AND gate takes the input of A1 and the inverted value of Shift Left). Essentially, the first AND gate is responsible for calculating the result bit when we are shifting left and the second AND gate is responsible for calculating the the result when we are **not** shifting left. 
		* Looking at the first AND gate, this AND gate will only output the right result when Shift Left is on (the second AND gate will always be 0 since it's passing the inverted Shift Left input signal); and, looking at the second AND gate, this AND gate will only output the right result when the Shift Left is off (the first AND gate will always be off since it is not receiving a signal from the Shift Left input). 
	* The result of both the AND gates is OR'd together to output a value for the bit. Since one of the AND gates will always output a 0, the result is dependent on whatever the result of the other AND gate is. For example, looking at the subsection for the Y1 output and we say A0 is 1 and A1 is 0. If the Shift Left bit is on, then it means the second AND gate is turned off and the first AND gate is turned on and since A0 is 1, then we will get an output of 1 (0 OR'd with 1 is 1). 

Now that the explanation makes some sense, here is an example of the circuit with the input being $$0011_{2}$$ (one image shows the Shift Left input being off and another image shows the Shift left being on):

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/Shift_Left_2.png" style="display: block; margin-left: auto; margin-right: auto;" />
<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/Shift_Left_3.png" style="display: block; margin-left: auto; margin-right: auto;" />

### 1-bit ALU

As you can tell, the ALU has many different parts to it, so we are going to build it one step at a time. First, we are going to start out by building a 1-bit ALU to actually understand how the ALU processes information. Again, our ALU is going to be responsible for 4 different things: adding, subtracting, and performing AND/OR logic.

*Aside: I know it doesn't make much sense to only have a 1-bit ALU (because what computer only does operations on 1 bit of information). However, take this example with a grain of salt. We want to explore more of how the data flows through the ALU compared to the analyzing the actual result of the ALU (we will study this part in the later part of the chapter when we build a multi-bit ALU).*

The first step in building this 1-bit ALU is building out some of the logic. We spent the last two chapters discussing how to build an Adder-Subtractor circuit. We can use that knowledge here to build a one-bit Adder-Subtractor circuit to perform two of the four operations we need (adding and subtracting). Below is a circuit that represents a 1-bit Adder-Subtractor:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/1-bit_ALU_1.png" style="display: block; margin-left: auto; margin-right: auto;" /> - THIS SHOULD BE REPLACED BY A DIAGRAM!

Next, we can also add further logic to our circuit by implementing the AND logic.  


plan out the 1 bit ALU section (diagrams instead!)
	- add AND logic
	- add shift logic
	- add operands logic and output logic
	- add in any flags we need
extend this to 4 bit ALU

