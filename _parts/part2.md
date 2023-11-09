---
title: Chapter 2
date: 2023-11-09
---

<html>
	<head>
	    <!-- Include MathJax script -->
		<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
	</head>
	<a href="/cpu_tutorial">< Go Back</a>
	<br />
</html>

# Chapter 02 - How Humans Intuitively Represent Numbers
**Topics Covered:** Formalizing Decimal, Base-10 Meaning

You've likely heard of the notion that computers only understand 0's and 1's, so in this section will make sense of that.

Let's start with the number 845 which was randomly chosen for the sake of formalizing the way your mind intuitively perceives multi-digit numbers. 845, along with any other number, can be expressed in a less comapct way as a sum of it's digit positions. Instead of trying to confuse you by explaining, lets work this through by example. It should be no surprise that $$845 = 800 + 40 + 5$$. Similarly, the number 94 can be expressed as the sum of 90 and 4. The same decomposition can be used on even larger numbers: $$29742 = 20000 + 9000+ 700 + 40 + 2$$. No matter how large the example gets, your mind is able to easily verify all these statements as true by adding up all of the numbers that form their components. 

*Aside:* For the next part, you will need to remember the mathematical rule that any digit raised to the power of 0 is equal to 1. That is $$1^0=2^0=3^0=...=1$$

Now let's try express the same number in a different way: $$845=8*10^2+4*10^1+5*10^0$$
At a first glance, this may not have seem true, but with a little bit of thinking, you should be able to verify that the left hand and ride hand side of that expression are equivalent. Although it seems like you've never thought of a number this way, this is the exact way your intuition processes these larger numbers. You've probably heard of the 'ones place', 'tens place', 'hundreds place', 'thousands place', and so on. Yet, you've never seen a number be described as this visually unappealing sum of exponents being multiplied by weights. The truth is, however, that these two concepts are the exact same. The right-most digit in a number is the ones place, and notice how $$10^0=1$$. Similarly, the digit second from the right is known as the tens place, and notice how $$10^1 = 10$$. The same logic holds for the next digit place which is known as the hundreds place, and once again notice how $$10^2=100$$. So really, the long expression at the start of the paragraph can be simplified to $$845=8*100 + 4*10 + 5*1 = 800 + 40 + 5$$. And now we're back at the original expression which was far from confusing in the previous paragraph. 

$$800 = 845=8*10^2+4*10^1+5*10^0$$

In this manner, you can express any number as a weighted sum of digits and corresponding powers of ten. Before we move on and explain why we are bothering with all of this, there are two more observations worth highlighting.

First, notice in any digit position, there can be one of ten distinct values: 0, 1, 2, 3, ... , 9 (Yes, 10 not 9 since 0 is a valid digit). This is our intuitive way of representing numbers and is formally called 'Base 10' or also 'Decimal'. Shortly, we will introduce a new base (don't get confused by this yet). To prevent future confusion, when we are referring to base 10 numbers (i.e. the regular way that you and I both represent numbers), I will subscript them with a 10, like so: $$845_{10}$$ Don't let this notation confuse you, just remember when you see that subscript, it means to treat the number the ordinary way you percieve it.

The second observation is a bit more obvious, but will shortly help you understand how counting works in other bases. The observation is that when we are counting in Base 10, if we get to the point where there is a 9 in any digit spot and we want to add one more, we get stuck because 9 is the largest value that can be stored in that position. When we run into that position, we have to 'carry-over'. More formally, that means to roll the current digit position to a 0 and then add one to the 'left' digit. So when we are counting and reach the digit 9, then the next step is to roll the 9 to a 0 and then add one to the next digit position which gives us 10. And if youre wondering what the other digit position is since 9 is a single-digit number, remember that adding 0's to the front of a value doesn't change it's meaning. That is $$9=09=009$$. So, in our counting example, you can say that $$09$$ is where we begin and then to add 1, we know to roll the 9 back to a 0 and then add one to the next digit position: which is 0 so it just becomes 1. Some more examples would include $$29$$ becoming $$30$$ or $$149$$ becoming $$150$$.

Our two step process for handling carry over is to
1. Rollback the 9 to a 0
2. Add one to the next most significant digit position (i.e. the digit position to the left)

It's worth noting that the second step can actually trigger any carryover. For example, try to add $$1$$ to $$299$$. You obviously know that the answer is $$300$$, but observe how there are two carry over's. 

I know everything so far has been painfully obvious, but as we finally move forward, formalizing your intuition will prove helpful.

As a recap, let the following table explain the decomposition of the digits of the number $$8459_{10}$$

|   | 8 | 4 | 5 | 9 |
|---|---|---|---|---|
| Weight of Position Expressed as a Power of Ten  | $$10^3$$  | $$10^2$$  | $$10^1$$  | $$10^0$$  |
| Weight of Position Expressed as a number  | 1000  | 100  | 10 | 1 |
| Your intuitive name for the digit position  | Thousands Place  | Hundreds Place  | Tens Place  | Ones Place  |
