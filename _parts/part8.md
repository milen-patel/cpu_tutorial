---
title: Chapter 8
date: 2023-11-10
---

<html>
	<head>
	    <!-- Include MathJax script -->
		<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
	</head>
	<a style="margin-bottom:5px" href="/cpu_tutorial">< Go Back</a>
	<p></p>
</html>

# Chapter 08 - Addition with Logic Gates
**Topics Covered:** Half Adder, Full Adder

Now that we have learned about logic gates, I think it's time we learned why they are so important (hopefully, the not so boring part). The average computer today can process around billions of operations per second which is mind-blowing. However, those processes can't happen without the use of logic gates. Logic gates allow us to build more complex circuits inside of computers which allow these kinds of processes to occur. Let me back up for a second here. I think the best way to describe logic gates is comparing them to legos. In chapter 06, we got introduced to the brick blocks, the tile blocks, the plate blocks, etc. Now, it's time for us to take those different pieces and build our first house.

As mentioned in the previous paragraph, we can use these logic gates to build more complicated circuits. You might be thinking what does he mean by more complicated circuits (I promise we will start out easy). The simplest circuit that we can have is an adder. Let's take a very simple example below:

![Example of 0+0](image.png)

Above we have an example of a circuit representing the equation 0+0=0 (in the form of A+B=C). In this example, what we are trying to demonstrate is that the OR gate can be used to add two numbers together. 

*Aside: In the example above, the A, B, C which are all 0s are not the number 0, but the bit 0, which is equivalent to the number 0 ($2^0*0=0$). So, technically, we are adding the bit 0 (the number 0) to another bit 0 (the number 0) giving us the bit 0 (the number 0).*

Let's look at a slightly different example:

![Example of 0+1](image-1.png)

Here, we are adding the bit 0 (number 0) with the bit 1 (number 1) which gives us the bit 1 (number 1). Makes sense right? I know I'm definetly boring you, so let's look a slightly harder example:

![Example of 1+1](image-2.png)

Here, we are adding the bit 1 (number 1) with the bit 1 (number 1) which gives us the bit 1 (number 1). If you realized there's a mistake here, you're right. The number 1 plus the number 1 should be returning 2. You might be thinking that there is no possible we can represent the number two (written as **11** in binary) with the current logic gate we have. This is where things get exciting.

Remember when I was talking about legos earlier, this is where we use them. Just like how we can connect different legos with each other to build crazy, unbelievable things, we can use logic gates to build crazy, unbelievable circuits. Here is where we introduce the half adder:

- insert image for half adder
- talk about what the half adder is doing (the sum gate and the carry gate) - now we can represent two bits (draw a truth table)
- we use an XOR gate for the sum gate and an and gate for the carry gate (explain the logic by referring to the truth table)

- talk about full adders 
- what makes them different