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

Now that we have learned about logic gates, I think it's time we learned why they are so important (hopefully, the not so boring part). The average computer today can process around billions of operations per second which is mind-blowing. However, those processes can't happen without the use of logic gates. Logic gates allow us to build more complex circuits inside of computers which allow these kinds of processes to occur. Let me back up for a second here. I think the best way to describe logic gates is comparing them to legos. In Chapter 6, we got introduced to the brick blocks, the tile blocks, the plate blocks, etc. Now, it's time for us to take those different lego pieces and build our first house.

As mentioned in the previous paragraph, we can use these logic gates to build more complicated circuits. You might be thinking what does he mean by more complicated circuits (I promise we will start out easy). The simplest circuit that we can have is an adder. Let's take an example below:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/0+0%20OR.png" style="display: block; margin-left: auto; margin-right: auto;" />

Above we have a circuit representing the equation $$A+B=X$$ (in other words, $$0_{2}+0_{2}=0_{2}$$). In this example, what we are trying to demonstrate is that the OR gate can be used to add two numbers together. 

*Aside: In the example above, the A, B, C which are all 0s are not the number 0, but the bit 0, which is equivalent to the number 0. So, technically, we are adding the bit 0 (the number 0) to another bit 0 (the number 0) giving us the bit 0 (the number 0). Review Chapter 3 if this does not make sense!*

Let's look at a slightly different example:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/0+1%20OR.png" style="display: block; margin-left: auto; margin-right: auto;" />

Here, we are adding the bit 0 (number 0) with the bit 1 (number 1) which gives us the bit 1 (number 1). Makes sense right? I know I'm definetly boring you, so let's look a slightly harder example:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/1+1%20OR.png" style="display: block; margin-left: auto; margin-right: auto;" />

Here, we are adding the bit 1 (number 1) with the bit 1 (number 1) which gives us the bit 1 (number 1). If you realized there's a mistake here, you're right. The number 1 plus the number 1 should be returning the number 2 (written as **10** in binary - notice how we need two bits). You might be thinking that there is no possible way we can represent the number two with just one OR gate (since it only outputs one bit). This is where things get exciting.

Remember when I was talking about legos earlier, this is where we use them. Just like how we can connect different legos with each other to build more complicated things, we can connect different logic gates to build more complicated circuits. Here is where we introduce the half adder:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/Half%20Adder.png" style="display: block; margin-left: auto; margin-right: auto;" />

The issue with using just an OR gate to represent the addition of two bits is that sometimes the bits can add up to the number 2 which we saw in the example in the paragraph above (meaning we need to somehow represent two bits in the output of a circuit since the number 2 is represented by two binary digits). This is where a half adder is useful because we can now represent the sum and carry out digits (which was talked about in Chapter 3). In the circuit above, the X acts as the least significant bit (the sum bit) and the Y acts as the most significant bit (the carry out bit). Now, your question might be how did we know to use the XOR gate to calculate X and the AND gate to calculate Y? Take a look at this truth table below:

| A | B | X (Sum) | Y (Carry Out)
|:---:|:---:|:---:|:---:|
| 0 | 0 |  0 | 0
| 0 | 1 |  1 | 0
| 1 | 0 |  1 | 0
| 1 | 1 |  0 | 1

Before we go any further, we should note that these calculations are the same as the ones in Chapter 3. First, looking at the Sum Column (X Output), we can see that it looks pretty familar to one of the truth tables in Chapter 6. If you were thinking an XOR gate, then you're right! And, looking at the Carry Out Column (Y Output), we can see that the output looks similar to an AND gate. Now we can see why the half adder uses a XOR gate and an AND gate instead of using a normal OR gate.

If we combine both of these bits together (in the form of YX with the X bit being the least significant bit and the Y bit being the most significant bit), we can have an output now that represents the equation $$1_{2}+1_{2}=2_{10}$$ because the number 2 can be represented as **10** in binary. Here is an example of the circuit below:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/Half%20Adder%201+1.png" style="display: block; margin-left: auto; margin-right: auto;" />

Here is another example of using a half adder for the equation $$1_{2}+0_{2}=1_{10}$$:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/Half%20Adder%201+0.png" style="display: block; margin-left: auto; margin-right: auto;" />

In this example, we can see that the output is **01** (or the number 1). Again, the X is used as the least significant bit and the Y is used as the most significant bit.

Remember how we were talking about lego bricks earlier? Well, you might hate me, but we are going to add another brick on top of our current circuit. Let's say we want to add another input to our circuit and call it the carry in bit (this will make a lot more sense, I promise). So now we want to add the A, B, and C bits together to output a sum bit (X) and a carry out bit (Y). Let's take a look at the truth table and build the full adder circuit:

| A | B | C | X (Sum) | Y (Carry Out)
|:---:|:---:|:---:|:---:|:---:|
| 0 | 0 | 0 | 0 | 0
| 0 | 0 | 1 | 1 | 0
| 0 | 1 | 0 | 1 | 0
| 0 | 1 | 1 | 0 | 1
| 1 | 0 | 0 | 1 | 0
| 1 | 0 | 1 | 0 | 1
| 1 | 1 | 0 | 0 | 1
| 1 | 1 | 1 | 1 | 1

We can use the explanation from Chapter 7 to construct and simplify an expression for the truth table above. Let's create an equation for the Sum bit:

1. Start with the initial expression from the SOP rule learned in Chapter 6: 

<p style="text-align: center;">$$\bar A \bar B C+\bar A B \bar C+A \bar B \bar C + A B C$$</p>
2. Use the distributive law to further isolate the equation: 
$$\bar A (\bar B C + B \bar C) + A (\bar B \bar C + B C)$$
3. First, use the the rule $$X \oplus Y = \bar X Y + X \bar Y$$ to simplify the first part of the expression: 
$$\bar A (B \oplus C) + A (\bar B \bar C + B C)$$
4. Then, use the rule $$\overline{X \oplus Y} = \bar X \bar Y + XY$$ to simplify the second part of the expression: 
$\bar A (B \oplus C) + A (\overline{B \oplus C})$
5. Wait a second! The expression now kind of looks similar to a rule we already used in Step 3 ($$X \oplus Y = \bar X Y + X \bar Y$$), so now we can simplify the expression to its final form: 
$$A \oplus B \oplus C$$

Now, let's look at how to find the equation for the carry over bit:

1. Start with the initial expression from the SOP rule learned in Chapter 6: 
$$\bar A B C + A \bar B C + A B \bar C + A B C$$
2. Use the distributive law to further isolate the equation: 
$$C(\bar A B + A \bar B) + AB(C + \bar C)$$
3. Use the rule $$X \oplus Y = \bar X Y + X \bar Y$$ to simplify the first part of the expression: 
$$C(A \oplus B) + AB(C + \bar C)$$
4. Use the rule $$X + \bar X = 1$$ to simplify the second part of the expression: 
$$C(A \oplus B) + AB(1)$$
5. Use the rule $$X*1$$ to further simplify the expression to its final form: 
$$C(A \oplus B) + AB$$

Now we have both of our equations. The equation for the Sum bit is $$A \oplus B \oplus C$$ and the equation for the carry over bit is $$C(A \oplus B) + AB$$. We can now build our circuit which is below:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/Full%20Adder.png" style="display: block; margin-left: auto; margin-right: auto;" />

Let's trace through the inputs in our truth table and look at it's respective circuit:

| A | B | C | X (Sum) | Y (Carry Out) | Picture
|:---:|:---:|:---:|:---:|:---:|:---:|
| 0 | 0 | 0 | 0 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/Full%20Adder.png" style="display: block; margin-left: auto; margin-right: auto;" />
| 0 | 0 | 1 | 1 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/Full%20Adder%202.png" style="display: block; margin-left: auto; margin-right: auto;" />
| 0 | 1 | 0 | 1 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/Full%20Adder%203.png" style="display: block; margin-left: auto; margin-right: auto;" />
| 0 | 1 | 1 | 0 | 1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/Full%20Adder%204.png" style="display: block; margin-left: auto; margin-right: auto;" />
| 1 | 0 | 0 | 1 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/Full%20Adder%205.png" style="display: block; margin-left: auto; margin-right: auto;" />
| 1 | 0 | 1 | 0 | 1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/Full%20Adder%206.png" style="display: block; margin-left: auto; margin-right: auto;" />
| 1 | 1 | 0 | 0 | 1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/Full%20Adder%207.png" style="display: block; margin-left: auto; margin-right: auto;" />
| 1 | 1 | 1 | 1 | 1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/Full%20Adder%208.png" style="display: block; margin-left: auto; margin-right: auto;" />

Cool right? Now, you might be thinking how can we further build on this concept. In Chapter 8, we are going to introduce the idea of ripple Ripple Carry Adders which will allow us to combine multiple Full Adders together to do multi-bit addition and subtraction (and, you'll see why the carry out bit was important to learn about)!


- fix explanations