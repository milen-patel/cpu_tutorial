---
title: Chapter 6
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

# Chapter 06 - Logic Gates
**Topics Covered:** AND, OR, NOT, XOR, NAND, The Universal Gate, Truth Tables

Now that I've made you suffer through enough chapters of binary, it's time to introduce a seperate yet similarly related concept: logic gates. There a few different types of logic gates we will need to understand, so I will introduce them one-by-one and then we will circle back and understand the bigger picture. This chapter should (hopefully) be a lighter read compared from the last few which probably involved you using a calculator to double check everything I was saying.

Simply put, a logic gate takes in a variable number of inputs (atleast 1) and produce a single output. The interesting part, that that all the inputs and outputs are either 0's or 1's. We have spent a few painful chapters understanding the nuances of binary, but you can put that aside for this chapter. In the next chapter, the connection between this chapter and all the previous ones will become apparent.

Let's start with the AND gate which takes in two inputs, and produces one output. If both of the inputs are 1, then the output of the AND gate is 1. For any other combination of inputs, the output will be a zero. The following image is what an AND gate looks like: X and Y serve as the two inputs and the output is given on the right hand side.

![image info](../_assets/part6/AND.png)

AND Gate Truth Table:

| X | Y | AND |
|---|---|---|
| 0 | 0 |  0 |
| 0 | 1 |  0 |
| 1 | 0 |  0 |
| 1 | 1 |  1 |

OR Gate Truth Table:

| X | Y | OR |
|---|---|---|
| 0 | 0 |  0 |
| 0 | 1 |  1 |
| 1 | 0 |  1 |
| 1 | 1 |  1 |

NAND Gate Truth Table:

| X | Y | NAND |
|---|---|---|
| 0 | 0 |  1 |
| 0 | 1 |  1 |
| 1 | 0 |  1 |
| 1 | 1 |  0 |

XOR Gate Truth Table:

| X | Y | XOR |
|---|---|---|
| 0 | 0 |  0 |
| 0 | 1 |  1 |
| 1 | 0 |  1 |
| 1 | 1 |  0 |

NOT Gate Truth Table:

| X | NOT |
|---|---|
| 0 | 1 |
| 1 | 0 |

Determinism