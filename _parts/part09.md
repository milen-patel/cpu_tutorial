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

# Chapter 09 - Arithmetic Logic Unit (ALU)
**Topics Covered:** ALU

Now that we understand some of the funamentals of how numbers and logic are represented in the computer world, I think it is time we broaden our knowledge by introducing the Artithemtic Logic Unit, ALU. 

### What is an ALU?

ALU can simply be defined as a circuit which allows us to perform arithmetic and logical operations using binary numbers. The ALU is where all of the processing in a computer occurs (so you can think of it as the main unit in the computer). You might have heard of the Central Processing Unit, or CPU, being called the "brains of the computer". Technically speaking, in modern computing, the ALU is actually a component that is part of the CPU. However, for our purposes, we are going to keep it simple and learn about the ALU first. ALUs are actually one of the oldest concepts in computer science and were originally suggested by John von Neumann in 1945, so a lot of older computers actually have basic implementations of ALUs and the only thing they could do was simple arithmetic and logical operations!

You might be asking yourself how is an ALU different than a Ripple Carry Adder, an Adder-Subtractor, etc. An ALU allows us to perform more operations than just adding and subtracting and allows us to choose which operation we want to specifically want to perform.

So we have defined what an ALU is, you might now be wondering what it consists of? I think it would be helpful to break it down into three simple parts: the input, the opcode, and the output. Let's try to define what each of these parts are and how they function:

* Input: The input is what you think it probably is. The ALU will take in two binary operands and we can define both of these to be n bits (they should equal the same length). Simple right?  
* Opcode: This is where the ALU gets interesting and relates to what makes an ALU different than what we have already learned. The opcode is an m-bit input into the ALU which allows us to execute different operations depending on the combination. So a 1-bit opcode will allows us to perform 2 various operations, 2-bit opcode will allow us to perform 4 various operations, a 3-bit opcode will allow us to perform 8 bit operations, a 4-bit opcode will allow us to perform 16 operations, and so on. As you can see, the general rule we follow for determining the number of operations we perform based on an n-bit opcode is $$2^n$$. So you might be wondering what these operations consist of. The opcode can essentially define various arithemtic operations such as addition, subtraction, incrementing, and decrementing; bitwise logical operations such as AND, OR, XOR, One's Complement; and, bit shift operations such logical shift or arithmetic shift. For our purposes, we will start out building an ALU with 4 different operations (add, subtract, bitwise AND, and shift left). Moreover, the ALU also calculates the result for all of these different operations at one time after the inputs get fed in, and then the opcode is used to select the output that we desire (this will make more sense as we start building our ALU).
* Output: Lastly, we have the output. This just represents the result of our operation. We can also have flags from our calculation such as a carry flag which specifies if there was carry-over (which is only used in unsigned arithmetic), overflow flag which specifies if there was an overflow (which is only used in signed arithmetic), zero flag which specifies if the actual result was 0, and negative flag which specifies if the result was negative.

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

*Aside: When performing division on an odd number, you might notice that the result isn't an integer. However, with the right bit shift (logical or arithmetic), the Base-10 result is equivalent to the floor of the original integer divided by 2. For example, if we had the number $$01010101_{2}$$ ($$85_{10}$$) and we performed a right shift operation, then the result is $$00101010_{2}$$ ($$42_{10}$$). Notice how the result is floor of the original Base-10 value divided by 2.*

*Aside: If we shift by multiple bits, then we are multiplying or dividing the original value by $$2^n$$ where n is the number of digits we shift by. For example, if we had the number $$01100110_{2}$$ ($$102_{10}$$) and performed a right shift by 3 bits, the result would be $$00001100_{2}$$ {$$12_{10}$$} (we are dividing by 8 in this case). To break it down further: $$102/(2^3)$$ --> $$102/8$$ --> $$12.75$$ which is $$12_{10}$$ rounded down (or floored).*

As mentioned in the above section, our ALU will contain the logic to perform a shift left operation (since logical and arithmetic shift left work the same way, we are just going to call it shift left). In order to do so, let's revisit some of the key ideas of how a shift left operation works:
* The first key idea is that the LSB will be replaced by a 0.
* Every bit will move to the left by 1.
* The MSB will be removed.
Now, that we understand those three key principles, let's break down how to build the circuit.

Let's first take the example of how to shift 1-bit to the left. Keep in mind, no one in the computer science world really cares about shifting 1 bit to the left and you might be thinking this is a bit silly too, but for our purposes, you will see how starting with this example can be helpful. Going back to our example, if the bit value is 0 and we shift left, nothing will happen. But, if the bit value is 1 and we shift left, we want to replace it with a 0. Below, we will build a simple circuit to help us get started:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/Shift_Left_simple.png" style="display: block; margin-left: auto; margin-right: auto;" />

For the input $$A_{0}=1$$, let's look at the output when Shift Left is off and when Shift Left is on.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/Shift_Left_simple_OFF.png" style="display: block; margin-left: auto; margin-right: auto;" />

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/Shift_Left_simple_ON.png" style="display: block; margin-left: auto; margin-right: auto;" />

Let's break this circuit down and think about this intuitively:
* The first thing that I would like to point out is the output is the result of two AND gates OR'd together. 
	* The right AND gate takes the input of the bit to it's right (which is GND or 0 in this case) and the Shift Left input. The left AND gate takes the input of the corresponding input bit (A0) and the inverted value of the Shift Left input. Essentially, the right AND gate is responsible for calculating the result bit when we are shifting left and the left AND gate is responsible for calculating the result bit when we are **not** shifting left. At any given time, only one of the AND gates will be working and feeding input through (since one AND gate will receive a negated Shift Left input causing it not work). This means the OR gate simply passes on the result of the AND gate that is function to the output. Think about it for a second. 
		* When the Shift Left bit is off, the right AND gate will automatically be turned off since it receives no signal to one of its inputs. However, the left AND gate will be on since we are feeding it the opposite value of the Shift Left bit (in this case, since Shift Left is off, it will be fed a positive input). This means the result of the AND gate will be whatever input we feed through A0.
		* When the Shift Left bit is on, the left AND gate will automatically be turned off since it is fed the inverted value of the Shift Left input (in this case, since Shift Left is on, it will be fed a negative input). However, the right AND gate will be on. This means the result of the AND gate will be whatever input we feed it which is GND or 0 in this case. So when the Shift Left bit is on, we are going to get a value of 0. 
	* Again, the OR gate simply acts as a way of passing on the input. It always receives a 0 as one of the inputs since one of the AND gates feeding into will always be off. However, the result of the other AND gate will be passed through enabling us to read it. Without the OR gate, we don't have a way of reading the output of the AND gates since there are 2 outputs and we wouldn't know which one contains the information we need.

We can now expand on this circuit and build a 4-bit shifter. We can copy the above logic for each bit position. However, the only thing that will change is instead of feeding the GND input to the right AND gate, we can feed it the value of the bit position to its right (this only applies to non-LSB position since the LSB is replaced by a 0 during a shift left operation). Below we have the completed 4-bit left shifter:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/Shift_Left_1.png" style="display: block; margin-left: auto; margin-right: auto;" />

Now here is an example of the circuit with the input being $$0011_{2}$$ (one image shows the Shift Left input being off and another image shows the Shift left being on):

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/Shift_Left_2.png" style="display: block; margin-left: auto; margin-right: auto;" />
<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/Shift_Left_3.png" style="display: block; margin-left: auto; margin-right: auto;" />

### 4-bit ALU

#### Building the ALU Logic

As you can tell, the ALU has many different parts to it, so we are going to build it one step at a time. In this section, we are going to build a 4-bit ALU. Again, our ALU is going to be responsible for 4 different things: adding, subtracting, performing AND logic, and performing shift left operations (the latter two are operations we learned above).

The first step in building this 4-bit ALU is of course building out some of the logic, and you might be asking yourself where we can start. Well, in the last chapter, we spent a fair amount of time discussing how to build an Adder-Subtractor circuit. Technically speaking, the Adder-Subtractor is a simple ALU itself because you feed in the two operands you want to perform arithmetic on, an opcode (0 for addition and 1 for subtraction), and receive an output based on the opcode we feed it. However, an ALU can be much more than an Adder-Subtractor circuit and the main purpose of this chapter is to understand that and how the logic actually flows through an ALU.

Let's go ahead and copy our Adder-Subtractor logic from Chapter 8 and start building out this ALU:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/4-bit_ALU_1.png" style="display: block; margin-left: auto; margin-right: auto;" /> 

Again, notice how we already use an opcode for the ALU (or Adder-Subtractor). The **C** bit can be used to toggle between addition and subtraction. 

However, we can abstract this circuit further by using an Integrated Circuit (IC) which was introduced at the end of Chapter 6. We will be using a 7483 IC which is a 4-bit binary full adder (otherwise known as a Ripple Carry Adder which we studied last chapter) which is displayed below:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/7483.png" style="display: block; margin-left: auto; margin-right: auto;" /> 

This IC has multiple inputs/outputs, let me quickly describe what each does to you. The A1, A2, A3, A4 inputs are for responsible for receiving the A input; the B1, B2, B3, B4 inputs are responsible for receiving the B input; the S1, S2, S3, S4 are responsible for outputting the sum of the addition/subtraction; C4 is the final carry-out; C0 is the initial carry-in (to signal whether we are performing addition or subtraction); and the VCC and GND are the power and ground respectively (you will see every IC requires VCC and GND inputs in order to properly power the circuit). 

We can use the 7483 IC to build an Adder-Subtractor by using the same logic we used to transform a Ripple Carry Adder to an Adder-Subtractor - use the C bit to add 1 to the circuit and flip all the bits of the subtrahend with the help of the multiplexor. Here is our ALU so far:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/4-bit_ALU_2.png" style="display: block; margin-left: auto; margin-right: auto;" /> 

Next, we can add in our logic for shifting left. We can copy the circuit which we build in the previous section for shifting left and add it to our ALU so our ALU will perform a shift left operation on Input A simultaneously (don't worry about the opcode just yet). Here is our updated circuit:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/4-bit_ALU_3.png" style="display: block; margin-left: auto; margin-right: auto;" /> 

In the circuit above, the ALU will perform addition/subtraction and a shift left operation on Input A. Below is an example of the ALU receiving two random inputs for Input A and Input B. The first image shows an example with the Shift Left bit turned off (meaning we do not perform any shifting) and the second image shows an example with the Shift Left bit turned on (which means shifting is performed). I will let you confirm the given logic in both of the images below as a challenge.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/4-bit_ALU_4.png" style="display: block; margin-left: auto; margin-right: auto;" /> 

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/4-bit_ALU_5.png" style="display: block; margin-left: auto; margin-right: auto;" /> 

Finally, we will add the last logical component to our ALU: the bitwise AND logic. In the circuit below, we do the same thing we did for the shift left logic. We are going to add the bitwise AND logic and the ALU will simultaneously calculate an output for Inputs A and B while also calculating an output for the addition/subtraction logic and shift left logic. Here is our circuit with the added bitwise logic:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part9/images/4-bit_ALU_6.png" style="display: block; margin-left: auto; margin-right: auto;" /> 

#### Using Operands to Select Output


#### Output and Flags



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