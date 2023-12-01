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

# Chapter 08 - Ripple Carry Adders
**Topics Covered:** Ripple-Carry Adders, Adder-Subtractor

Now that we know how to do simple addition using half adders and full adders (which are used to do one-bit addition), I believe we are ready to learn more about ripple-carry adders (for, you guessed it, multi-bit addition). Remember, how I kept telling you that we'd talk about the carry-in bit. Well, get excited because this is the chapter where we get to learn why that bit was so important that we needed to create a half adder on steriods (the full adder).

Imagine now we are adding two numbers: 3 and 1. In binary format, we can represent 3 as **11** and 1 as **01**. Essentially, our expression here can be represented as **11+01**. Let's add these values using a table.

| | Third Bit (Carry Over) | Second Bit | First Bit |
|:-- |:---:|:---:|:---:|
| Carry Over from Previous Column  |   | 1 |   |
| Number 3 |   | 1 | 1 |
| Number 1 |   | 0 | 1 |
| **Result** | **1** | **0** | **0** |

In the above table, we add the binary equivalent of the number 3 (row 2) with the binary equivalent of the number 1 (row 3) to get a result of **100** which equals the number 4 (row 4). But, more importantly, do you notice how we now have a carry-over bit from the first column to the second column? This is why full-adders are so important: now, we can finally use our new carry-in input to account for that carry-over bit in the second column. Let's now try to build this using multiple full adders (otherwise called a ripple carry adder which is, nonetheless, multiple full adders which are combined).

Before we get into building the circuit for full adders, let's go over a few details. Notice how we have two bits for each of the numbers, we can use a full adder to do the addition for each corresponding bit (or each column of the table). So, essentially, we can use a full adder to represent the addition happening in the *First Bit* column and use another full adder to represent the addition happening in the *Second Bit* column. **Each corresponding bit (in other words, each bit in the same position) will be added together from both binary values.** Let's look at the circuit below to see what this looks like.

![Ripple Carry 1](<../assets/part8/Ripple Carry 1.png>)

In the example above, let's let AB be equal to the number 3 or 11 in binary and let's let CD be equal to number 1 or 01 in binary. Notice how each corresponding bit goes to the same full adder (so the bits B and D go to Full Adder #1 and the bits C and A go to Full Adder #2). Intuitively, this makes sense because we are adding bits which are in the same place value.

So where does the carry-in bit come into play? Notice how when we add the bits in the *First Bit* column, there's a carry over? Well, we can use the carry-over bit outputted from the first full adder and insert into the carry-in input in the second full adder. This is shown in the image below.

![Ripple Carry 2](<../assets/part8/Ripple Carry 2.png>)

This is an important concept because now we are on our way to creating our first Ripple Carry Adder. We can use the carry-over bit to now do addition with multi-bit binary values. Without the carry-over ouput and the carry-in input on a full adder, we wouldn't accurately be able to do multi-bit addition. 

Let's finish the circuit and display the output:

![Ripple Carry 3](<../assets/part8/Ripple Carry 3.png>)

Congrats!!! You just built your first Ripple Carry Adder. 

Now, let's try a slightly harder example. This time we will be added 2 4-bit binary values (the general rule for ripple carry adders is you can add 2 n-bit binary values at a time). So, just for example sake, I chose two random numbers: 15, 1111 in binary, and 8, 1000 in binary. We can create another table like we did for the last example:

| | Fifth Bit (Carry Over) | Fourth Bit | Third Bit | Second Bit | First Bit |
|:-- |:---:|:---:|:---:|:---:|:---:|
| Carry Over from Previous Column  |   | 0 | 0 | 0 | 0 |
| Number 15 |   | 1 | 1 | 1 | 1 |
| Number 8 |   | 1 | 0 | 0 | 0 |
| **Result** | **1** | **0** | **1** | **1** | **1** |

So the result of **1111+1000** was **10111** which is 32. Let's build our ripple carry adder:

![Ripple Carry Adder 4](<../assets/part8/Ripple Carry Adder 4.png>)

So again, we need to add the bits from the same place values and carry over the carry-over output of one full adder into the carry-in input of the next full adder. 

*Aside: In both of the ripple carry adder examples, in the first full adder, we have a weird looking symbol going into the carry-in input. This symbol is just supposed to represent a grounded input meaning it sends an electrical signal of 0 or off.*

Now that you're an expert in full adders and ripple carry adders, it's time for another round of roids. This time around we are going to create a circuit called the adder-subtractor. An adder-subtractor allows us to perform subtraction with binary values with a few tweaks to our ripple carry adder. Before we introduce the circuit, let's go over a few important details:

1. In order to subtract one binary value from another, we need to invert the subtrahend (the number that is being subtracted) by using two's complement (invert every bit position and then add one to the result). 
2. We need to learn what a 2-to-1 multiplexor is first. Essentially, we have a selector bit (C in the truth table and circuit below) which chooses between two different inputs. So if we have two inputs, A and B, the A bit will be outputted if the selector bit is 0 and the B bit will outputted if the selector bit is 1. That's it, simple right? I've included the truth table and an example of the circuit below:

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

![2-to-1 Multiplexor](<../assets/part8/2-to-1 Multiplexor.png>)

Now, that we have reviewed binary subtraction and what a multiplexor is, let's take a look at an adder-subtractor circuit: 

![Adder Subtractor](<../assets/part8/Adder Subtractor.png>)

So, let's dissect this. The first thing we notice is the use of the 2-to-1 multiplexor, not gates, and the use of the extra input button (which I will refer to as the A/S bit) all the way to the right. Remember, how we were talking about knowing how to subtract, that's mainly why we implemented all of these extra components. In an adder-subtractor circuit, the addition works as it does in a ripple carry adder - nothing changes. However, in order to do subtraction, we need to invert the bits and add one to the binary value. When we turn on the A/S bit, see how that input is connected to the carry-in input of the first full adder and is also connected to all the multiplexors. Respectfully, this adds the one we mentioned above and then chooses the inverted bit from the multiplexors (notice how one input of each multiplexor is inverted).

Now that we understand how the circuit functions at a high level, let's take a look at two examples. The first example I want to look at is basic addition. Again, addition in an adder-subtractor circuit works the same way it does in a ripple carry adder. Before we jump into the example, note that input A is labelled as ABCD and carries the value of $$1000_{2}$$ and input B is labelled as EFGH and carries the value of $$1111_{2}$$. Together, they should add to $$10000_{2}$$.

![Adder Subtractor Add Example](<../assets/part8/Adder Subtractor 1.png>)

Next, let's take a look at a subtraction example. Wen we do subtraction, the format or expression we use is $$B-A$$ and both B and A are in two's complement form. Moreover, we ignore the last output bit (the V bit) - the last carry-out bit. In our example below, the value of B is $$0011_{2}$$ and the value of A is $$0001_{2}$$. 

![Adder Subtractor Subtract Example](<../assets/part8/Adder Subtractor 2.png>)

The last thing I want to point out is that the output will only be in two's complement when we are doing subtraction and $$B<A$$ or if the A/S bit is 1 AND the last carry-out bit is 0. For the first case, let's think about intuitively. If we are adding two positive numbers, the result will always be positive meaning we don't need to use two's complement. If we are subtracting two numbers and $$B<A$$, that result will always be negative signaling a need for two's complement - try this out! We can actually add a signal to our circuit to indicate whether the result is in two's complement or not which is shown below:

![Adder Subtractor 3](<../assets/part8/Adder Subtractor 3.png>)