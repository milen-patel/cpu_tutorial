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

In the above table, we add the binary equivalent of the number 3 (row 2) with the binary equivalent of the number 1 (row 3) to get a result of **100** which equals the number 4 (row 4). 

Now, you might be wondering how can we implement this using full adders. Notice how we have two bits for each of the numbers, we can use a full adder to do the addition for each corresponding bit (or each column of the table). So, essentially, we can use a full adder to represent the addition happening in the *First Bit* column and use another full adder to represent the addition happening in the *Second Bit* column. **Each corresponding bit (in other words, each bit in the same position) will be added together from both binary values.** Let's look at the circuit below to see what this looks like.

![Ripple Carry 1](<../assets/part8/Ripple Carry 1.png>)

In the example above, let's let AB be equal to the number 3 or 11 in binary and let's let CD be equal to number 1 or 01 in binary. Notice how each corresponding bit goes to the same full adder (so the bits B and D go to Full Adder #1 and the bits C and A go to Full Adder #2). Intuitively, this makes sense because we are adding bits which are in the same place value.

So where does the carry-in bit come into play? Notice how when we add the bits in the *First Bit* column, there's a carry over? Well, in the first full adder, we can use the carry-over bit and insert into the carry-in input in the second full adder. This is shown in the image below.

![Ripple Carry 2](<../assets/part8/Ripple Carry 2.png>)

This is an important concept because now we are on our way to creating our first Ripple Carry Adder. We can use the carry-over bit to now do addition with multi-bit binary values. Without the carry-over ouput and the carry-in input on a full adder, we wouldn't accurately be able to do multi-bit addition. 

Let's finish the circuit and display the output:

![Ripple Carry 3](<../assets/part8/Ripple Carry 3.png>)

Congrats! We just build our first Ripple Carry Adder. 


- fix explanation
- more complicated example w/ ripple carry adder
- adder subtractor circuit (explain how it works)
- example w/ adder subtractor circuit