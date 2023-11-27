---
title: Chapter 4
date: 2023-11-09
---

<html>
	<head>
	    <!-- Include MathJax script -->
		<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
	</head>
	<a style="margin-bottom:5px" href="/cpu_tutorial">< Go Back</a>
	<p></p>
</html>

# Chapter 04 - Fixed-Width Numbers
**Topics Covered:** Bits, Bytes, Width Requirements

In regular decimal, we never think of the number of digit positions we are using. If you want to convey a number to someone else, you just say the number as it is regardless of how many digits it has. Obviously, humans work with numbers that usually use fewer than ~10-15 digits, but we could theoretically convey a number with 100 different digits and it wouldn't cause an issue. Computers, on the other hand, are not so flexible. As will become evident throughout the next chapters, things have to be both consistent and precise. The computer we design will not be a fan of binary numbers with variable number of digits. Let's motivate this better with an example.

Suppose somebody hands you a piece of paper and tells you that it's contents are in binary and that there are 100 numbers written on the sheet. You unfold the paper and see an entire page of 0's and 1's. It's important to remember that the paper's contents are strictly binary, so there's no concept of writing each number down on a different line - all we can do is write 0's and 1's next to each other. Now you are tasked with converting the 100 numbers back to decimal. Suppose the first ten digits on the paper are $$1001101011$$. Do you see the issue yet? How do you know if those ten digits are 10 different 1-bit numbers? Or if the first 5 digits correspond to the first number and the second five corresponding to the next number? Or are there three numbers in those ten bits? It is impossible to know! The issue is that you don't know how many binary digits (bits) each number will use. Without further specification or more information, this problem is actually impossible to solve. And it turns out, this is a valid issue computers run into. Many chapters down the line, we will discuss the concept of memory which as you probably know is a way to store information. However, all of the information in your computer's memory is stored as bits, so your computer has some internal rules to be able to distinguish the first value in memory from the second.

An easy solution to this issue, is to set a rule for our computer, that every number will be represented with the same number of bytes. The first rule that we will set for our computer is as follows: all numbers will be represented with eight binary digits. Why 8? The truth is we could pick any number we want to. Eight is a small enough number such that we aren't working with incredibly large binary digit strings, but also big enough where we aren't overly restricted. In fact, after we finish designing our computer to represent all numbers with eight binary digits, we will devote a chapter to redesigning the computer to represent all numbers with a different length! In the real world, different computers will use different number of bits. 32 and 64 are both common in modern processors. For those of you who have used a Windows computer and attempted to download something, you probably came across 32-bit and 64-bit versions on the download page - these are different versions of the same product but intended to work on two different types of CPUs!

A brief interjection of computer vocabulary that I will use onwards:

* A **bit** is a single digit in binary which is either 0 or 1.
  * The unique bits: 0, 1
* A **nibble** is four bits.
  * The unique nibbles: $$0000$$, $$0001$$, $$0010$$, $$0011$$, $$0100$$, $$0101$$, $$0110$$, $$0111$$, $$1000$$, $$1001$$, $$1010$$, $$1011$$, $$1100$$, $$1101$$, $$1110$$, $$1111$$
* A **byte** is eight bits.
  * The unique bytes: $$00000000$$, $$00000001$$, $$00000010$$, $$\dots$$, $$11111111$$

*Aside: In most modern computers, a byte is the smallest unit of memory. We said computers represent all data as 0's and 1's, and so the grouping of 8-bits that composes a single byte can be thought of as a unit of information. You've probably heard of a megabyte (MB) which is equal to 1 million bytes. On the same line, a gigabyte (GB) is equal to roughly 1 billion bytes. Now you can assign some meaning to these random storage sizes you've periodically encountered.*

We just set an important rule that will hold for all of the remaining chapters, so let's look at some of the important consequences.

First, the smallest decimal number we can represent with 8-bits (a byte) is $$0_{10}$$ which in binary is now $$0000 0000_2$$. Second, the largest binary value we can represent with a byte is $$1111 1111_2$$, and if we convert that to decimal we get $$255_{10}$$ (do the conversion yourself and verify this. It should also be clear why the string of all 1's is the biggest number). The second takeaway is important here, if we want to represent the number $$256_{10}$$ with our computer, we simply cannot. We can represent $$255_{10}$$ and we can represent $$10_{10}$$, but if we try to add them, our computer will be unable to represent the value of the sum which is $$265_{10}$$. If you don't believe me, convert $$265_{10}$$ to binary and you'll see that it needs more than 8 bits to be represented. 

This is analagous to setting an arbitrary rule that we can't use more than five digits in decimal. In that world $$99999$$ is biggest number, and $$0$$ is the smallest number. If you add $$90000$$ and $$10000$$, although both of those numbers can be represented, then sum $$100000$$ cannot be because it uses more than 5 digit positions.

Turns out that simple rule is enough to avoid all issues of arbitrary number representations. Yes we accept the tradeoff of not being able to represent very large numbers, but it will save us a lot of pain down the road. I know we've covered binary to a painful extent and it hasn't gotten you any closer to understanding how a computer works, so I feel bad telling you that the next chapter is also about binary. But, once we cover this last piece of information, we will move on to the more interesting topics.

Let's conclude this chapter by revisiting the original problem statement that motivated this issue. In a world where our rule applied, if the same stranger handed you a paper with only 0's and 1's on it and told you to decipher the values, you would now be able to. The first 8 bits should be treated as the binary representation of the first number, the second 8 bits correspond to the next number, and so on. In fact, if we know there are 100 numbers and our rule dictates each number is represented with a byte, then we would expect there to be exactly $$100*8=800$$ bits on that piece of paper.
