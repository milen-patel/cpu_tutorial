---
title: Chapter 7
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

# Chapter 07 - Addition with Logic Gates
**Topics Covered:** Half Adder, Full Adder

Now that we have learned about logic gates, I think it's time we learned why they are so important (hopefully, the not so boring part). As mentioned in Chapter 6 briefly, logic gates are the building blocks of computers and when you chain logic gates together (to build circuits), you can essentially build a computer. That being said, we move onto the next step of our journey - building circuits. In Chapter 6, we skimmed over the definition of a logic circuit. In computer science, a circuit allows us to represent more complex logic beyond the basic AND and OR gates and allows us to transform our binary inputs into the outputs we desire. An easier way to think about this is by using legos. In Chapter 6, we got introduced to the brick blocks, the tile blocks, the plate blocks, etc. Now, it's time for us to take those different lego pieces and build our first circuit.

### Half Adder

In the earliest chapters we were introduced to base-2 and learned how to add two binary numbers together. In this chapter, let's automate this process by designing a circuit that can add two binary numbers together. I just want to make a quick note by stating that you can build a circuit to do a lot of different things. But, we are going to start out by building circuits that add binary values together for two reasons. First, if you take any computer science degree, most classes are going to start from the ground up just like we did with addition in kindergarden and first grade and work their way up in difficulty. And the second reason is in early computing, most computers were built to serve basic needs such as solving arithmetic problems. So, I think it would be helpful to follow this course and then build up our knowledge.

You already know that computers can add incredibly large numbers together, but for the sake of us getting started, we will restrict our circuit to adding two 1-bit values (recall that a bit is a binary digit), namely A and B. Let's take an example below as a first contender of a circuit that takes 1-bit values A and B as input and outputs their sum ($$A+B$$) as Y:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/images/OR_Gate_1.png" style="display: block; margin-left: auto; margin-right: auto;" />

Above we have a circuit representing the equation $$A+B=Y$$ (in other words, $$0_{2}+0_{2}=0_{2}$$). Essentially, this circuit adds two numbers together (in this case, a 0 and a 0) and outputs a number (which again, is 0). Congrats, you just build your first circuit! In this example, what we are trying to demonstrate is that the OR gate can be used to add two numbers together and is a simple addition circuit (which was also briefly mentioned in Chapter 6).

*Aside: In the example above, the A, B, C which are all 0s are not the number 0, but the bit 0, which is equivalent to the number 0. So, technically, we are adding the bit 0 (the number 0) to another bit 0 (the number 0) giving us the bit 0 (the number 0). Review Chapter 3 if this does not make sense!*

Let's look at a slightly different example:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/images/OR_Gate_2.png" style="display: block; margin-left: auto; margin-right: auto;" />

Here, we are adding the bit 0 (number 0) with the bit 1 (number 1) which gives us the bit 1 (number 1). In other terms, this equation can be written as $$0_{2}+1_{2}=1_{2}$$. Makes sense right? I know I'm definetly boring you, so let's look a slightly harder example:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/images/OR_Gate_3.png" style="display: block; margin-left: auto; margin-right: auto;" />

Here, we are adding the bit 1 (number 1) with the bit 1 (number 1) which gives us the bit 1 (number 1). If you realized there's a mistake here, you're right. The number 1 plus the number 1 should be returning the number 2 (written as **10** in binary - notice how we need two bits). You might be thinking that there is no possible way we can represent the number two with just one OR gate (since it only outputs one bit). This is where things get exciting.

Remember when I was talking about legos earlier, this is where we use them. Just like how we can connect different legos with each other to build more complicated things, we can connect different logic gates to build more complicated circuits. Here is where we introduce the half adder:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/images/Half_Adder_1.png" style="display: block; margin-left: auto; margin-right: auto;" />

The issue with using just an OR gate to represent the addition of two bits is that sometimes the bits can add up to the number 2 which we saw in the example in the paragraph above (meaning we need to somehow represent two bits in the output of a circuit since the number 2 is represented by two binary digits). We can represent the equation as $$A_{2}+B_{2}=XY_{2}$$. This is where a half adder circuit is useful because we can now represent the sum and carry-out digits (which was talked about in Chapter 3). In the circuit above, the Y acts as the least significant bit (the sum bit) and the X acts as the most significant bit (the carry bit). Now, your question might be how did we know to use the XOR gate to calculate Y and the AND gate to calculate X? Take a look at this truth table below which represents the addition of two 1-bit binary values:

| A | B | Y (Sum) | X (Carry)
|:---:|:---:|:---:|:---:|
| 0 | 0 |  0 | 0
| 0 | 1 |  1 | 0
| 1 | 0 |  1 | 0
| 1 | 1 |  0 | 1

Before we go any further, we should note that these calculations are the same as the ones in Chapter 3. First, looking at the Sum Column (Y Output), we can see that it looks pretty familar to one of the truth tables in Chapter 6. If you were thinking an XOR gate, then you're right! And, looking at the Carry Column (X Output), we can see that the output looks similar to an AND gate. Now we can see why the half adder uses a XOR gate and an AND gate instead of using a normal OR gate.

If we combine both of these bits together (in the form of XY with the Y bit being the least significant bit and the X bit being the most significant bit), we can have an output now that represents the equation $$1_{2}+1_{2}=2_{10}$$ because the number 2 can be represented as **10** in binary. Here is an example of the circuit below:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/images/Half_Adder_2.png" style="display: block; margin-left: auto; margin-right: auto;" />

Here is another example of using a half adder for the equation $$1_{2}+0_{2}=1_{01}$$:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/images/Half_Adder_3.png" style="display: block; margin-left: auto; margin-right: auto;" />

In this example, we can see that the output is **01** (or the number 1). Again, the Y is used as the least significant bit and the X is used as the most significant bit.

### Full Adder

Remember how we were talking about lego bricks earlier? Well, you might hate me, but we are going to add another brick on top of our current circuit. Let's say we want to add another input to our circuit and call it the carry-in bit (this will make a lot more sense, I promise). So now we want to add the A, B, and C (carry-in) bits together to output a sum bit (Y) and a carry-out bit (X), so the equation we are now trying to build our circuit for can be represented by $$A_{2}+B_{2}+C_{2}=XY_{2}$$. Let's take a look at the truth table and build the full adder circuit (again, this truth table is a representation of adding 3 1-bit values and their ouputs):

| A | B | C | Y (Sum) | X (Carry Out)
|:---:|:---:|:---:|:---:|:---:|
| 0 | 0 | 0 | 0 | 0
| 0 | 0 | 1 | 1 | 0
| 0 | 1 | 0 | 1 | 0
| 0 | 1 | 1 | 0 | 1
| 1 | 0 | 0 | 1 | 0
| 1 | 0 | 1 | 0 | 1
| 1 | 1 | 0 | 0 | 1
| 1 | 1 | 1 | 1 | 1

*Aside: If the above truth table is still confusing, think about it this way. Again, the equation we are trying to represent with the truth table and circuit is $$A_{2}+B_{2}+C_{2}=XY_{2}$$. If we add any row of values together, such as the last one where all the inputs are equal to the binary bit 1, then an easy trick we can do to find the output is convert all the inputs to numbers (which in this case are all equal to 1), add them (the result being 3), and then convert them back to binary (which gives us **11**).*

Next, we are going to use the SOP trick we learned in Chapter 6 to construct and simplify an expression for the truth table above. If you want to skip this part, feel free. I only included this part if you wanted to go over another SOP example (as long as you understand that you can take the ouput of a truth table, convert it to a boolean expression, and then use that expression to build a circuit, you understand the basis of how to build a logical circuit) Let's create an equation for the Sum bit:

* Start with the initial expression from the SOP rule learned in Chapter 6: 

<div style="text-align: center;"><strong>$$\bar A \bar B C+\bar A B \bar C+A \bar B \bar C + A B C$$</strong></div>

* Use the distributive law to further isolate the equation: 

<div style="text-align: center;"><strong>$$\bar A (\bar B C + B \bar C) + A (\bar B \bar C + B C)$$</strong></div>

* First, use the the rule $$X \oplus Y = \bar X Y + X \bar Y$$ *(here's a challenge - try to create two truth tables for each of the expressions to check if they are equivalent)* to simplify the first part of the expression: 

<div style="text-align: center;"><strong>$$\bar A (B \oplus C) + A (\bar B \bar C + B C)$$</strong></div>

* Then, use the rule $$\overline{X \oplus Y} = \bar X \bar Y + XY$$ *(you can use the truth table trick again to see if both expressions are the same)* to simplify the second part of the expression: 

<div style="text-align: center;"><strong>$$\bar A (B \oplus C) + A (\overline{B \oplus C})$$</strong></div>

* Wait a second! The expression now kind of looks similar to a rule we already used in Step 3 ($$X \oplus Y = \bar X Y + X \bar Y$$), so now we can simplify the expression to its final form: 

<div style="text-align: center;"><strong>$$A \oplus B \oplus C$$</strong></div>

Now, let's look at how to find the equation for the carry over bit:

* Start with the initial expression from the SOP rule learned in Chapter 6: 

<div style="text-align: center;"><strong>$$\bar A B C + A \bar B C + A B \bar C + A B C$$</strong></div>

* Use the distributive law to further isolate the equation: 

<div style="text-align: center;"><strong>$$C(\bar A B + A \bar B) + AB(C + \bar C)$$</strong></div>

* Use the rule $$X \oplus Y = \bar X Y + X \bar Y$$ to simplify the first part of the expression: 

<div style="text-align: center;"><strong>$$C(A \oplus B) + AB(C + \bar C)$$</strong></div>

* Use the rule $$X + \bar X = 1$$ to simplify the second part of the expression: 

<div style="text-align: center;"><strong>$$C(A \oplus B) + AB(1)$$</strong></div>

* Use the rule $$X*1$$ to further simplify the expression to its final form: 

<div style="text-align: center;"><strong>$$C(A \oplus B) + AB$$</strong></div>

*Aside: If you are wondering how I knew some of the boolean identities or expressions to substitute, you can find a list of boolean identities in our appendix. Usually, you won't have to memorize these, so we aren't going to concern ourselves with understanding their particularities.*

Now we have both of our equations. The equation for the Sum bit is **$$A \oplus B \oplus C$$** and the equation for the carry over bit is **$$C(A \oplus B) + AB$$**. We can now build our circuit which is below:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/images/Full_Adder_1.png" style="display: block; margin-left: auto; margin-right: auto;" />

Let's trace through the inputs in our truth table and look at it's respective circuit:

| A | B | C | Y (Sum) | X (Carry Out) | Picture
|:---:|:---:|:---:|:---:|:---:|:---:|
| 0 | 0 | 0 | 0 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/images/Full_Adder_1.png" style="display: block; margin-left: auto; margin-right: auto;" />
| 0 | 0 | 1 | 1 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/images/Full_Adder_2.png" style="display: block; margin-left: auto; margin-right: auto;" />
| 0 | 1 | 0 | 1 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/images/Full_Adder_3.png" style="display: block; margin-left: auto; margin-right: auto;" />
| 0 | 1 | 1 | 0 | 1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/images/Full_Adder_4.png" style="display: block; margin-left: auto; margin-right: auto;" />
| 1 | 0 | 0 | 1 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/images/Full_Adder_5.png" style="display: block; margin-left: auto; margin-right: auto;" />
| 1 | 0 | 1 | 0 | 1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/images/Full_Adder_6.png" style="display: block; margin-left: auto; margin-right: auto;" />
| 1 | 1 | 0 | 0 | 1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/images/Full_Adder_7.png" style="display: block; margin-left: auto; margin-right: auto;" />
| 1 | 1 | 1 | 1 | 1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part7/images/Full_Adder_8.png" style="display: block; margin-left: auto; margin-right: auto;" />

Cool right? Now, you might be thinking how can we further build on this concept. In Chapter 8, we are going to introduce the idea of ripple Ripple Carry Adders which will allow us to combine multiple Full Adders together to do multi-bit addition and subtraction (and, you'll see why the carry-out bit was important to learn about)!