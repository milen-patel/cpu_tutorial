---
title: Chapter 7
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

![Example of 0+0](../assets/part7/0+0%20OR.png)

Above we have an example of a circuit representing the equation 0+0=0 (in the form of A+B=C). In this example, what we are trying to demonstrate is that the OR gate can be used to add two numbers together. 

*Aside: In the example above, the A, B, C which are all 0s are not the number 0, but the bit 0, which is equivalent to the number 0 ($$2^0*0=0$$). So, technically, we are adding the bit 0 (the number 0) to another bit 0 (the number 0) giving us the bit 0 (the number 0).*

Let's look at a slightly different example:

![Example of 0+1](../assets/part7/0+1%20OR.png)

Here, we are adding the bit 0 (number 0) with the bit 1 (number 1) which gives us the bit 1 (number 1). Makes sense right? I know I'm definetly boring you, so let's look a slightly harder example:

![Example of 1+1](../assets/part7/1+1%20OR.png)

Here, we are adding the bit 1 (number 1) with the bit 1 (number 1) which gives us the bit 1 (number 1). If you realized there's a mistake here, you're right. The number 1 plus the number 1 should be returning 2. You might be thinking that there is no possible we can represent the number two (written as **10** in binary) with the current logic gate we have. This is where things get exciting.

Remember when I was talking about legos earlier, this is where we use them. Just like how we can connect different legos with each other to build crazy things, we can use logic gates to build crazy circuits. Here is where we introduce the half adder:

![Example of a Half Adder](../assets/part7/Half%20Adder.png)

The issue with using just an OR gate to represent the addition of two bits is that sometimes the bits can add up to the number 2 which we saw in the example in the paragraph above (meaning we need to somehow represent two bits in the output of a circuit). This is where a half adder is useful because we can now represent the sum and carryout (which was talked about in Chapter 3). In the circuit above, the Y acts as the least significant bit (the sum bit) and the X acts as the most significant bit (the carry out bit). Now, your question might be how did we know to use the XOR gate to calculate Y and the AND gate to calculate X? Take a look at this truth table below:

| A | B | Y (Sum) | X (Carry Out)
|:---:|:---:|:---:|:---:|
| 0 | 0 |  0 | 0
| 0 | 1 |  1 | 0
| 1 | 0 |  1 | 0
| 1 | 1 |  0 | 1

Before we step any further, we should note that these calculations are the same as the ones in Chapter 3. First, looking at the Sum column (Y output), we can see that it looks pretty familar to one of the truth tables in Chapter 6. If you were thinking an XOR gate, then you're right! And, looking at the Carry Out column (X output), we can see that the output looks similar to an AND gate. If we combine both of these bits together, we can have an output now that represents the equation $$1+1=2$$ with the Y bit being the least significant bit and the X bit being the most significant bit (**10** written in binary). Here is an example of the circuit below:

![Example of a Half Adder 1+1](../assets/part7/Half%20Adder%201+1.png)

Here is another example of using a half adder for the equation $$1+0=1$$:

![Example of a Half Adder 1+0](../assets/part7/Half%20Adder%201+0.png)

In this example, we can see that the output is **01** (or the number 1). 