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

# Chapter 05 - What about Negative Numbers?
**Topics Covered:** Two's Complement, One's Complement, Subtraction

By reading the title of this chapter, you probably realized I made a huge oversight in the second chapter: we never considered the possibility of a negative number. In this chapter, we will see how negative numbers are represented in binary and explore some related concepts.

In decimal, detecting and working with negative numbers is easy: you just prefix the number in question with the negation symbol, -. -845 is clearly a negative number, 845 is clearly a positive number, and 0 is neither. During the last chapter, I hinted at the idea that computers can only work with the presence or absence of electricity which we interpret as 0's and 1's. So, prefixing a binary number with a negative sign may work for just converting between binary and decimal on a piece of paper, but when it comes to building physical computers, this won't get us very far.

So, how do we represent negative numbers if we can't use the age-old negative symbol. As it turns out, there are a few different ways of solving this issue. Last chapter, we set a rule that all numbers in our computer will be represente with exactly 8 bits (i.e. a byte). This rule, as mentioned when introduced, will hold for the rest of this book including this chapter. So, all the numbers we consider will be exactly 8 bits. I will provide the convenience of splitting the first four bits from the last four to improve readability. So, instead of me writing $$11010101_2$$, I will write $$1101\ 0101_2$$. Don't let this confuse you into thinking it means anything different, I am just adding a break in the middle so the 1's and 0's don't get jumbled together as you read them.

