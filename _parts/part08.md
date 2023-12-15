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

Now that we know how to do simple addition using half adders and full adders (which are used to do one-bit addition), I believe we are ready to learn about ripple-carry adders (for, you guessed it, multi-bit addition). Moreover, we will get to learn why the carry-in bit was so crucial that we needed to create a half adder on steriods (the full adder).

### Full Adders and the Carry-In Bit

Imagine now we are adding two numbers: $$3_{10}$$ and $$1_{10}$$. In binary format, these numbers would be represented as $$11_{2}$$ and $$01_{2}$$ respectively. Essentially, our expression here can be represented as $$11_{2}+01_{2}$$. Let's add these values using a table.

| | Third Bit (Carry Over) | Second Bit | First Bit |
|:-- |:---:|:---:|:---:|
| Carry Over from Previous Column  |   | 1 |   |
| Number 3 |   | 1 | 1 |
| Number 1 |   | 0 | 1 |
| **Result** | **1** | **0** | **0** |

In the above table, we add the binary equivalent of the $$3_{10}$$ (row 2) with the binary equivalent of the number $$1_{10}$$ (row 3) to get a result of $$100_{2}$$ which is equivalent to $$4_{10}$$ (row 4). But, more importantly, do you notice how we now have a carry-over bit from the first column to the second column? This is why full-adders are so important: now, we can finally use the new carry-in input on the full-adder to account for that carry-over bit in the second column. Hold on a second though. In the last chapter, we learned that Half Adders and Full Adders can be used to do 1-bit addition. But now that we know the advantage of Full Adders lies in their ability to utilize the carry-in input and carry-out output, we can effectively chain multiple Full Adders together. This configuration, known as a Ripple Carry Adder, allows us to represent multi-bit addition with carry-over logic.

### Ripple Carry Adder

#### 2-Bit Example

Let's analyze how a Ripple Carry Adder is just multiple Full Adders combined before we dive into building the circuit. Notice from the example above how we have two bits for each of the numbers, we can use a full adder to do the addition for each corresponding bit (or each column of the table). So, essentially, we can use a full adder to represent the addition happening in the **First Bit** column and use another full adder to represent the addition happening in the **Second Bit** column. **Each corresponding bit (in other words, each bit in the same position) will be added together from both binary values.** This is pretty similar to how we do regular addition: add the one's place, the ten's place, the hundred's place, and so on. Let's look at the circuit below to see what this example looks like:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Ripple_Carry_1.png" style="display: block; margin-left: auto; margin-right: auto;" />

*Aside: As you can see in the above, we don't have our typical circuit with the gates. Usually when we build circuit diagrams, we try to simplify the circuit by using a schematic symbol. In this case, the box we have is used to represent a Full Adder instead of using the entire Full Adder circuit we built in Chapter 7 multiple times. You will see these schematic symbols used throughout the book and I will label them or point out what they should be representing.*

*Aside: You might have also seen a weird looking symbol going into the carry-in input (the dash). This symbol is just supposed to represent a grounded input meaning it sends an electrical signal of 0 or off. Don't worry about the carry-in input for the initial Full Adder of our Ripple Carry Adder circuit (we will get to this later).*

Notice in the example above how each corresponding bit in the same place value goes to the same full adder (so the bits A1 and B1 go to Full Adder #1 and the bits A2 and B2 go to Full Adder #2). Intuitively, this makes sense because we are adding bits which are in the same place value (as mentioned earlier).

So, let's review how the carry-in bit comes into play. As pointed out earlier, notice how when we add the bits in the **First Bit** column, there's a carry over? Well, we can use the carry-over bit outputted from the first full adder and insert it into the carry-in input in the second full adder. This is shown in the image below.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Ripple_Carry_2.png" style="display: block; margin-left: auto; margin-right: auto;" />

This is an important concept because now we are on our way to creating our first Ripple Carry Adder. We can use the carry-over bit to now do addition with multi-bit binary values. Without the carry-over output and the carry-in input on a full adder, we wouldn't accurately be able to do multi-bit addition since the carry-over logic wouldn't be supported. 

Let's finish the circuit by displaying the output:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Ripple_Carry_3.png" style="display: block; margin-left: auto; margin-right: auto;" />

Congrats! You just built your first Ripple Carry Adder. 

#### What the Carry Bit Means

In the example above, you might have noticed that the Carry output was on. Usually, Ripple Carry Adders are used to do unsigned binary addition (review Chapter 5 if you still are unclear on what this means). If you recall, in unsigned binary addition, we have an **error** when the **Carry** bit is on because we are adding 2 2-bit numbers, but our result needs 3-bits in order to be represented accurately. If this still doesn't make sense, I'll make it simple for you in a one-line: if the **Carry** bit is on after performing unsigned binary addition (which is what Ripple Carry adders do), we have an issue.

#### 4-bit Example

Now, let's try a slightly harder example. This time we will be added 2 4-bit binary values (the general rule for ripple carry adders is you can add 2 N-bit binary values at a time). So, just for example sake, I chose two random numbers: $$2_{10}$$ and $$8_{10}$$ ($$0010_{2}$$ and $$1000_{2}$$ in binary respectfully). We can create another table like we did for the last example:

| | Fifth Bit (Carry Out) | Fourth Bit | Third Bit | Second Bit | First Bit |
|:-- |:---:|:---:|:---:|:---:|:---:|
| Carry Over from Previous Column  |   | 0 | 0 | 0 | 0 |
| Number 2 |   | 0 | 0 | 1 | 0 |
| Number 8 |   | 1 | 0 | 0 | 0 |
| **Result** |  | **1** | **0** | **1** | **0** |

So the result of $$0010_{2}+1000_{2}$$ was $$1010_{2}$$ which is $$10_{10}$$. Let's build our ripple carry adder:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Ripple_Carry_4.png" style="display: block; margin-left: auto; margin-right: auto;" />

So again, we need to add the bits from the same place values and carry over the carry-over output of one full adder into the carry-in input of the next full adder.

### Adder-Subtractor 

Now that you're an expert in Full Adders and Ripple Carry Adders, it's time for another round of roids. This time around we are going to create a circuit called the Adder-Subtractor. An Adder-Subtractor allows us to perform both addition and subtraction with binary values with a few tweaks to our Ripple Carry Adder. Before we introduce the circuit, let's go over 2 important ideas that we need to know about first:

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
* The first thing I would like discuss is our inputs. When using an adder-subtractor, we are going to normalize the inputs using two's complement. So Input A (on the bottom) and Input B (on the top) should be using two's complement form whether we are doing addition or subtraction. In our case, since we are only using 4 bits, we can only represent numbers from $$-8_{10}$$ to $$7_{10}$$.
* Next, let's talk about the A/S bit and the use of the multiplexors for Input A. Looking at the A/S bit, the first thing we need to understand is if the A/S bit is off, then we are doing addition and if the A/S bit is on, then we are doing subtraction. This A/S bit is inputed into multiple places: the carry-in bit of Full Adder 1 and all the multiplexors above Input A. You might be asking why that is and the answer to your question is to perform subtraction. In our circuit, the subtraction operation is represented by the equation $$B-A$$ where B and A are both binary values. When the A/S bit is on, it allows us to perform two's complement on Input A which, in turn, allows us to addition (remember, it's easier to negate the subtrahend and add the binary values instead of subtract). Essentially, we are now able to represent $$B+(-A)$$ with our circuit. And from the introduction to Adder-Subtractors above, it is mentioned how we need to do 2 things in order to find the two's complement of Input A: invert the bits and add 1. Let's understand how the A/S bit actually let's us do both of these things:
	* It is able to invert the bits through the use of the multiplexors because these multiplexors are fed the normal input of its respective bit from A and the inverted input of its respective bit from A. When the A/S bit is turned on, all of these multiplexors choose the inverted bit. This allows us to meet the first condition of being able to subtract (inversion).
	*  We are also able to add 1 by feeding a positive signal from the A/S bit to the first carry-in bit of Full Adder 1 which allows us to meet the second condition of being able to subtract (adding 1).
* Now that we understand the purpose of the A/S bit and multiplexors, let's dig in further. When the A/S bit is 0, it means we are doing addition. Again, this means we are choosing the normal input of A and nothing is being fed into the carry-in input of Full Adder 1. So essentially, when the A/S bit is turned off, we are just dealing with a Ripple Carry Adder.
* In the case of subtraction, we are able to use the two's complement of the subtrahend when the A/S bit is 1 (the more specific details of how the A/S bit is able to do this is covered in the 2nd point). This enables us to perform addition with the Input B and the two's complement version of Input A, $$B+(-A)$$ instead of having to build a whole other circuit to do $$B-A$$ (because remember we are dealing with adders and not subtractors).
* Lastly, as we read in Chapter 5, overflow can occur when dealing with binary values in two's complement (again, overflow in two's complement is equivalent to getting a positive result adding two negative values or a negative result adding two positive values meaning our result is out of range and cannot be represented accurately). In order to see whether our addition or subtraction results in overflow, we just need to take the XOR of the carry-in and carry-out bits of the MSB (don't worry about how this exactly works, but if you look at the top-right of the Adder-Subtractor circuit, you will see this implementation). 

Now that we understand how the circuit functions at a deeper level, let's take a look at a few examples. The first example I want to look at is basic addition. Again, addition in an adder-subtractor circuit works the same way it does in a ripple carry adder (but with two's complement). Before we jump into the example, note that input A is $$0100_{2}$$ and input B is $$0001_{2}$$ ($$4_{10}$$ and $$1_{10}$$ respectively). Together, they should add to $$0101_{2}$$ ($$5_{10}$$).

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Adder_Subtractor_2.png" style="display: block; margin-left: auto; margin-right: auto;" />

Now, we are going to take an example of addition which results in overflow. In this new example, input A is $$0100_{2}$$ and input B is $$0100_{2}$$ resulting in an overflow (I will let you work the math and logic out).

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Adder_Subtractor_3.png" style="display: block; margin-left: auto; margin-right: auto;" />

Next, let's take a look at a subtraction example. Wen we do subtraction, the format or expression we use is $$B-A$$ (since we are inverting the A input) and both B and A are in two's complement form. In our example below, the value of B is $$0011_{2}$$ and the value of A is $$0001_{2}$$. So essentially, we are trying to solve for the expression $$3_{10}-1_{10}$$.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Adder_Subtractor_4.png" style="display: block; margin-left: auto; margin-right: auto;" />

The last example we will take a look at is also a subtraction example, but it will result in overflow. In this example, the value of B is $$1000_{2}$$ and the value of A is $$0010_{2}$$. In other words, we are trying to represent the expression $$-8_{10}-2_{10}$$ with our circuit.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part8/images/Adder_Subtractor_5.png" style="display: block; margin-left: auto; margin-right: auto;" />

Wow, that was a lot of information. I would highly recommend understanding everything in detail in this chapter and playing around with the Digital files to really see how the circuits work. In the next chapter, we will be going over the ALU which uses the concept of an Adder-Subtractor and builds on it. 