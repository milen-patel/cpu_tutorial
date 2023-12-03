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

Now that we understand some of the funamentals of how numbers and logic are represented in the computer world, I think it is time we broaden our knowledge by introducing the Artithemtic Logic Unit, ALU. ALU can simply be defined as a circuit which allows us to perform arithmetic and logical operations using binary numbers and all of the processing in a computer goes through the ALU (so you can think of it as the main unit in the computer or the brains). Technically speaking, you might have heard the Central Processing Unit, or CPU, being called the brains of the computer. In modern computing, the ALU is actually a circuit that is part of the CPU. However, for our purposes, we are going to keep it simple and learn about the ALU first. ALUs are actually one of the oldest concepts in computer science and were originally suggested by John von Neumann in 1945, so a lot of older computers actually have basic implementations of ALUs and the only thing they could do was simple arithmetic and logical operations!

So we have defined what an ALU is, you might now be wondering what it consists of? I think it would be helpful to break it down into three simple parts: the input, the opcode, and the output. Let's try to define what each of these parts are and how they function:

* Input: The input is what you think it probably is. The ALU will take in two binary operands (integers only) and we can define both of these to be n bits. Depending on the number of bits, we can change the internal circuitry of the ALU to adjust its operations (we will go into this more further into the chapter). But for now, think about the ripple carry adder or adder/subtractor. Remember, how we could add/subtract two n-sized binary values. 
* Operands: This is where the ALU gets interesting. The operand is an n-bit input into the ALU which allows us to execute different operations depending on the combination. So a 2-bit operand will allow us to perform 4 various operations, a 3-bit operand will allow us to perform 8 bit operations, a 4-bit operand will allow us to perform 16 operations, and so on. As you can see, the general rule we follow for determining the number of operations we perform based on an n-bit input is $$2^n$$. So you might be wondering what these operations consist of. The operand can essentially define various arithemtic operations such as addition, subtraction, incrementing, and decrementing; bitwise logical operations such as AND, OR, XOR, One's Complement; and, bit shift operations. Don't worry if you don't understand some of the words or how this works because that's the purpose of this chapter. 
* Output: Lastly, we have the output. This just represents the result of our operation. We can also have other outputs from our calculation such as a carry-out bit which specifies if there was carry-over, zero bit which specifies if the actual result was 0, negative bit which specifies if the result was negative, or overflow bit which specifies if there is an overflow meaning the result cannot be represented by the output because it is too large.




- go into how the different operations work
    - build a one-bit ALU
    - multi-bit ALU
        - give a diagram of the ALU (best thing to do is insert an image)
        - explain what's happening from top to bottom
        - go into the middle portion and explain the circuitry (first only do addition, subtraction)
        - add in logic operations (just two)
        - add in bitwise operations 
        - build the circuitry for flags and explain how this works
