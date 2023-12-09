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

# Chapter 08 - Ripple Carry Adders
**Topics Covered:** Ripple-Carry Adders, Adder-Subtractor

Now that we know how to do simple addition using half adders and full adders (which are used to do one-bit addition), I believe we are ready to learn more about ripple-carry adders (for, you guessed it, multi-bit addition). Moreover, we will get to learn why the carry-in bit was so crucial that we needed to create a half adder on steriods (the full adder).

### Ripple Carry Adder

Imagine now we are adding two numbers: $$3_{10}$$ and $$1_{10}$$. In binary format, these numbers would be represented as $$11_{2}$$ and $$01_{2}$$ respectively. Essentially, our expression here can be represented as $$11_{2}+01_{2}$$. Let's add these values using a table.

| | Third Bit (Carry Over) | Second Bit | First Bit |
|:-- |:---:|:---:|:---:|
| Carry Over from Previous Column  |   | 1 |   |
| Number 3 |   | 1 | 1 |
| Number 1 |   | 0 | 1 |
| **Result** | **1** | **0** | **0** |

In the above table, we add the binary equivalent of the $$3_{10}$$ (row 2) with the binary equivalent of the number $$1_{10}$$ (row 3) to get a result of $$100_{2}$$ which is equivalent to $$4_{10}$$ (row 4). But, more importantly, do you notice how we now have a carry-over bit from the first column to the second column? This is why full-adders are so important: now, we can finally use the new carry-in input on the full-adder to account for that carry-over bit in the second column. Let's now try to build this using a ripple carry adder, which is, nonetheless, multiple combined full adders.

Before we get into building the circuit for ripple carry adders, let's go over a few details. Notice how we have two bits for each of the numbers, we can use a full adder to do the addition for each corresponding bit (or each column of the table). So, essentially, we can use a full adder to represent the addition happening in the **First Bit** column and use another full adder to represent the addition happening in the **Second Bit** column. **Each corresponding bit (in other words, each bit in the same position) will be added together from both binary values.** This is pretty similar to how we do regular addition: add the one's place, the ten's place, the hundred's place, and so on. Let's look at the circuit below to see what this example looks like.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Ripple_Carry_1.png" style="display: block; margin-left: auto; margin-right: auto;" />

*Aside: As you can see in the above, we don't have our typical circuit with the gates. Usually when we build circuit diagrams, we try to simplify the circuit by using a schematic symbol. In this case, the box we have is used to represent a full adder instead of drawing the entire full circuit adder we had in Chapter 7 multiple times. You will see these schematic symbols used throughout the book and we will label them or point out what they should be representing.*

*Aside: You might have also seen a weird looking symbol going into the carry-in input (the dash). This symbol is just supposed to represent a grounded input meaning it sends an electrical signal of 0 or off.*

In the example above, let's let AB be equal to $$11_{2}$$ and let's let CD be equal to $$01_{2}$$. Notice how each corresponding bit goes to the same full adder (so the bits B and D go to Full Adder #1 and the bits C and A go to Full Adder #2). Intuitively, this makes sense because we are adding bits which are in the same place value (as mentioned earlier).

So, let's review how the carry-in bit comes into play again. As pointed out earlier, notice how when we add the bits in the *First Bit* column, there's a carry over? Well, we can use the carry-over bit outputted from the first full adder and insert it into the carry-in input in the second full adder. This is shown in the image below.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Ripple_Carry_2.png" style="display: block; margin-left: auto; margin-right: auto;" />

This is an important concept because now we are on our way to creating our first Ripple Carry Adder. We can use the carry-over bit to now do addition with multi-bit binary values. Without the carry-over output and the carry-in input on a full adder, we wouldn't accurately be able to do multi-bit addition. 

Let's finish the circuit by displaying the output:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Ripple_Carry_3.png" style="display: block; margin-left: auto; margin-right: auto;" />

Congrats!!! You just built your first Ripple Carry Adder. 

Now, let's try a slightly harder example. This time we will be added 2 4-bit binary values (the general rule for ripple carry adders is you can add 2 n-bit binary values at a time). So, just for example sake, I chose two random numbers: $$15_{10}$$ and $$8_{10}$$ ($$1111_{2}$$ and $$1000_{2}$$ in binary respectfully). We can create another table like we did for the last example:

| | Fifth Bit (Carry Out) | Fourth Bit | Third Bit | Second Bit | First Bit |
|:-- |:---:|:---:|:---:|:---:|:---:|
| Carry Over from Previous Column  |   | 0 | 0 | 0 | 0 |
| Number 15 |   | 1 | 1 | 1 | 1 |
| Number 8 |   | 1 | 0 | 0 | 0 |
| **Result** | **1** | **0** | **1** | **1** | **1** |

So the result of $$1111_{2}+1000_{2}$$ was $$10111_{2}$$ which is $$32_{10}$$. Let's build our ripple carry adder:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Ripple_Carry_4.png" style="display: block; margin-left: auto; margin-right: auto;" />

So again, we need to add the bits from the same place values and carry over the carry-over output of one full adder into the carry-in input of the next full adder.

### Adder-Subtractor 

Now that you're an expert in full adders and ripple carry adders, it's time for another round of roids. This time around we are going to create a circuit called the adder-subtractor. An adder-subtractor allows us to perform subtraction with binary values with a few tweaks to our ripple carry adder. Before we introduce the circuit, let's go over 2 important ideas that we need to know about first:

1. When we want to find the value of a negative integer number in binary, we use two's complement. Two's complement follows three simple steps: find the binary representation of the positive version of the negative integer number, flip all the binary bits, and then add one to the result. Review chapter 5 if this does not make sense.
2. We also need to learn what a 2-to-1 multiplexor is. Essentially, we have a selector bit (C in the truth table and circuit below) which chooses between two different inputs. So if we have two inputs, A and B, the A bit will be outputted if the selector bit is 0 and the B bit will outputted if the selector bit is 1. That's it, simple right? I've included the truth table and an example of the circuit below:

| C | A | B | Y |
|:--:|:--:|:--:|:--:|
| 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 0 |
| 0 | 1 | 0 | 1 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 0 | 0 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 0 |
| 1 | 1 | 1 | 1 |

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Multiplexor.png" style="display: block; margin-left: auto; margin-right: auto;" />

Also, if you noticed this circuit and truth table look a little familiar, they are! In Chapter 6, you actually saw how the circuit looked like (and its inputs and outputs) rather than just the schematic (this circuit will appear a few more times, so make sure you take the time to understand what it's doing).

Now, that we have reviewed binary subtraction and what a multiplexor is, let's take a look at an adder-subtractor circuit: 

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Adder_Subtractor_1.png" style="display: block; margin-left: auto; margin-right: auto;" />

So, let's dissect this: 
* The first thing I would like discuss is our inputs. When using an adder-subtractor, we are going to normalize the inputs using two's complement. So Input A (which are the bits ABCD) and Input B (which are the bits EFGH) should be using two's complement form whether we are doing addition or subtraction. In our case, since we are only using 4 bits, we can only represent numbers from $$-8_{10}$$ to $$7_{10}$$.
* Next, let's discuss how addition works and introduce the use of the multiplexors. As you notice, we have an extra (third input): the A/S bit (Adder/Subtractor for short). When the A/S bit is 0 or off, it means we are doing addition and when the A/S is 1 or on, it means we are doing subtraction. In the case of addition, our circuit works exactly like the Ripple Carry Adder (except the inputs are in two's complement). So this means Input A is passed in as normal. And for Input B, we choose the non-inverted bits since the multiplexor receives a select bit of 0. This means we can do addition as normal. Keep in mind though that since we are working with two's complement, it is possible to see overflow. When doing addition, if the end result results in a negative number (when the MSB is equal to 1), it means we have an overflow. In our case, if bit Y is equal to 1, then we have an overflow.
* In the case of subtraction, this is where things get interesting. Let's say we are trying to solve for the following expression: $$5_{10}-2_{10}$$. Wait a second, there's a problem here. If you realized we don't have a circuit for subtraction, then you're absolutely correct. At the beginning of the section to Adder-Subtractor circuits, do you remember how we reviewed the rules for two's complement. Well, we can use it here. Essentially, we can use two's complement to turn this equation into $$5_{10}+(-2_{10})$$. We are turning the positive $$2_{10}$$ into a negative $$2_{10}$$ so we can do addition instead since we already know how to do addition. So, we can use the Ripple Carry Adder to also do subtraction by changing up a couple of things here and there.
* Wait a second, we aren't totally done yet. Now that we understand how to do subtraction using the Adder-Subtractor circuit, we need to understand how the circuit works. In order to do subtraction, we need to invert the bits and add one to the binary value of the subtrahend. When we turn on the A/S bit, see how that input is connected to all the multiplexors and the carry-in input of the first full adder. Respectfully, this inverts all of the bits of the subtrahend by choosing the inverted bit using the multiplexors (notice how one input of each multiplexor is inverted through the use of the NOT gate) and then adds one in order to flip the second value.
* Lastly, as we read in Chapter 5, overflow can occur when dealing with binary values in two's complement. In order to see whether our addition or subtraction results in overflow, we just need to take the XOR of the carry-in and carry-out bits of the MSB.

Now that we understand how the circuit functions at a deeper level, let's take a look at a few examples. The first example I want to look at is basic addition. Again, addition in an adder-subtractor circuit works the same way it does in a ripple carry adder (but with two's complement). Before we jump into the example, note that input A is $$0100_{2}$$ and input B is $$0001_{2}$$. Together, they should add to $$0101_{2}$$.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Adder_Subtractor_2.png" style="display: block; margin-left: auto; margin-right: auto;" />

Now, we are going to take an example of addition which results in overflow. In this new example, input A is $$0100_{2}$$ and input B is $$0100_{2}$$ resulting in an overflow.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Adder_Subtractor_3.png" style="display: block; margin-left: auto; margin-right: auto;" />

Next, let's take a look at a subtraction example. Wen we do subtraction, the format or expression we use is $$B-A$$ (since we are inverting the A input) and both B and A are in two's complement form. In our example below, the value of B is $$0011_{2}$$ and the value of A is $$0001_{2}$$. So essentially, we are trying to solve for the expression $$3_{10}-1_{10}$$.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Adder_Subtractor_4.png" style="display: block; margin-left: auto; margin-right: auto;" />

The last example we will take a look at is also a subtraction example, but it will result in overflow. In this example, the value of B is $$1000_{2}$$ and the value of A is $$0010_{2}$$. In other words, we are trying to represent the expression $$-8_{10}-2_{10}$$ with our circuit.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Adder_Subtractor_5.png" style="display: block; margin-left: auto; margin-right: auto;" />

Wow, that was a lot of information. I would highly recommend understanding everything in detail in this chapter and playing around with the Digital files to really see how the circuits work. In the next chapter, we will be going over the ALU which uses the concept of an Adder-Subtractor and builds on it. 