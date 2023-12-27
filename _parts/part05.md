---
title: Chapter 5
date: 2023-11-09
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

# Chapter 05 - What about Negative Numbers?
**Topics Covered:** Two's Complement, One's Complement, Subtraction

By reading the title of this chapter, you probably realized I made a huge oversight in the third chapter: we never considered the possibility of a negative number. In this chapter, we will see how negative numbers are represented in binary and explore some related concepts.

In decimal, detecting and working with negative numbers is easy: you just prefix the number in question with the negation symbol, -. -845 is clearly a negative number, 845 is clearly a positive number, and 0 is neither. During the last chapter, I hinted at the idea that computers can only work with the presence or absence of electricity which we interpret as 0's and 1's. So, prefixing a binary number with a negative sign may work for just converting between binary and decimal on a piece of paper, but when it comes to building physical computers, this won't get us very far.

So, how do we represent negative numbers if we can't use the age-old negative symbol? As it turns out, there are a few different ways of solving this issue. Last chapter, we set a rule that all numbers in our computer will be represented with exactly 8 bits (i.e. a byte). This rule, as mentioned when introduced, will hold for the rest of this book. However, for the next few paragraphs we will consider nibbles which are 4-bit values (effectively a half-byte). This just makes illustration easier. But we will end the chapter with discussion of 8-bit values.

Recall that a nibble is a 4 bit value. We know the smallest value we can represent with a nibble is $$0000_2=0_{10}$$. Similarly, the largest value we can represent is $$1111_2=15_{10}$$. And if you recall from a previous chapter, we showed that with four bits, you can represent $$2^4=16$$ different values.

### The basic approach (Sign-Magnitude)

In decimal, when we want to represent a negative number, we prepend the negative sign to the number in question. Although we don't have a negative sign in binary, so what if we just reserve the left-most bit for indicating if the number in question is positive or not. If the number starts with a 1, we interpret the remaining three bits as a negative number. Similarly, if the number starts with a 0, we interpret the remaining three bits as a positive number.

We know that the binary value $$101_2$$ is equal to $$5_{10}$$. In our proposed scheme this would mean that $$1101_2=-5_{10}$$ while $$0101=5_{10}$$. 

For another example, we know that $$011_2$$ is equal to $$3_{10}$$. So under our schema, $$1011_2=-3_{10}$$ while $$0011_2=3_{10}$$.

This is pretty easy to understand, isn't it! And hopefully you can see the value of the last chapter where we established a constant width for any number in question. By looking at any number, you can determine if it is positive or negative simply by looking at the value of the first bit. I pose the following questions: if you have 4 bits (i.e. a nibble), what is the biggest number we can represent under this schema and what is the smallest number we can represent under this schema? Since we are reserving the left-most bit for indicating the sign of our number, we are effectively reduced down to three digits for representing the number in question itself. With three digits, the biggest binary number we can make is $$111_2=7_{10}$$. So, the largest number we can represent using a nibble is $$0111_2=7_{10}$$. As for the smallest number, don't get confused and think it is 0 since we just introduced negative numbers! Instead, use the same idea that 7 is the largest magnitude we can represent, so $$1111_2=-7_{10}$$ means that -7 is the smallest number we can represent. Under this scheme, we can represent -7 through 7.

Take a second and count how many different values that is: -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7. Notice something? That is only 15 values but when we considered only positive values, we found we could get 16 values in four bytes. We know that with 4 bits we should be able to represent 16 numbers, so how did we possibly lose a value?

You may have already discovered the solution, but the issue involves attempting to represent zero. Although $$-0$$ isn't really a meaningful concept, our scheme allows us to both represent $$0_{10}$$ as $$0000_{2}$$ and $$-0_{10}$$ as $$1000_2$$. The issue is that we are wasting two different binary strings on representing the value zero, when we only need one.

I know what you are thinking: thats barely any information lost and isn't a big deal. But, computer designers wouldn't ever settle for that tradeoff. With computers storing the mass amount of information they do now combined with the incomprehensible amount of mass data collection that is constantly occurring, this wasted space would actually add up to be quite an expensive tradeoff. 

Even then, that's not the only issue. If we were to use this design, adding numbers would become quite difficult. Sure, we could probably design some algorithm that would work, but the easy-to-understand idea of stacking numbers on top of each other and adding corresponding digit positions from right-to-left wouldn't work here. And, I know we haven't quite discussed it yet, but binary subtraction also becomes much more harder. So, we abandon this idea.

### Two's Complement
It turns out there's another way of handling negative numbers that doesn't waste any space (i.e. we can represent 16 different values with 4 bytes instead of 15). Even better, the normal, intuitive way of adding numbers still holds. And, as we will see afterwards, subtraction is easily accomplished.

The Big Idea: *Negate the value of the higest order bit and treat every other bit position the same*.

This new, preferrable approach is called Two's Complement. That's all there is, I promise. But let's take a few minutes to digest this claim and look at the consequences. Still, we are working with nibbles.

What does this big idea really tell us? Remember how each digit position corresponds to a different power of two. The right-most digit has a weight of $$2^0=1$$ and then the next digit has a weight of $$2^1=2$$ and so on. This is saying that the left-most digit, has a weight of $$-2^3=-8$$. The numerical interpretation of every other digit position remains the exact same, but with the left-most digit, we assign it the negative weight.

Under Two's Complement, lets try convert the value $$1001_2$$ to decimal. Using the expansion rules we learned about in the third chapter, we know that this expands out to be $$1*-2^3 + 0*2^2 + 0*2^1 + 1*2^0$$ which simplifies down to $$1*-2^3 + 1 * 2^0$$ which further reduces to $$-8+1=-7$$.

Let's try another example by converting $$1111_2$$. In long form this gives us 

$$1*-2^3 + 1*2^2 + 1*2^1 + 1*2^0$$

$$-2^3 + 2^2 + 2^1 + 2^0$$

$$-8 + 4 + 2 + 1$$

$$-1$$

This still means we can represent positive numbers without issue. Try convert $$0111_2$$:

$$0*-2^3 + 1*2^2 + 1*2^1 + 1*2^0$$

$$1*2^2 + 1*2^1 + 1*2^0$$

$$2^2 + 2^1 + 2^0$$

$$4 + 2 + 1$$

$$7$$

In both of our approaches, we can tell if a number is negative by looking at the left-most bit. If it is 1, the number is negative and if 0 then positive.

Now, let's answer the same questions we posed in the initial approach: what is the biggest and smallest number we can represent.

The Biggest Number: We know that the weight of the left-most digit is negative. So, whenever we set that bit position to 1, we are subtracting from our total value. For the remaining three digit positions, their weights are all positive and add to the total value. So we can get the largest value by setting the negative-weighted position to 0 while setting all the positively weighted positions to 1. This is $$0111_2=7_{10}$$.

The Smallest Number: We know that the weight of the left-most digit position is negative which means that position helps bring our number down. The other three positions are weighted positively which help bring our number up. Therefore, to get the lowest value possible we want to set the bit position of the negatively weighted slot to 1 while leaving all others as 0. If we turned any of the other three bit positions to a one, we would be adding a positive increment to our value which would stray us away from the answer. So, this is $$1000_2$$ which in decimal is $$-2^3=-8$$.

So the smallest value we can represent is -8 and the largest is 7. You can represent any value in between (it would be a good exercise to stop and do that now). Unlike our previous approach which let us represent -7 through 7, we have found a way to represent the values -8 through 7 using the same amount of space! This is pretty cool. And it turns out we can't do better than this because we have represented 16 values in 4 bit positions, which from earlier, we know to be the highest amount possible.

Oh - and in Two's Complement, there is no such thing as -0 and 0. If you don't believe me, try find two different binary values in this scheme that both evaluate to zero. The only one you will be able to find is $$0000_2$$. Nice!

### Converting Between Negative and Positive

You may be wondering, how do I take a negative number in base 10 and convert it to binary? It turns out, you can convert the positive reprsentation to binary, and then Two's Complement has a unique property that makes negating numbers really easy.

How to Negate a Number in Two's Complement? Invert every bit position (i.e. $$0\Rightarrow1$$ and $$1\Rightarrow0$$) and then add one to the result. You don't need to worry about why this works, but moreso on how to do it.

Let's try an example. Suppose we want to represent $$-5_{10}$$ in binary. Well, we know that 5 in binary can be represented as $$0101_2$$. So our rule says we first invert every bit position. So let the 1's become 0's and vice versa. After this, we have $$1010_2$$. And then the second step of the rule says to add 1 to the value. So we perform $$1010_2 + 0001_2$$ and obtain $$1011_2$$ as our final result. We can verify this by converting $$1011_2$$ back to decimal and expect to get -5.

Here's the work:

$$1*-2^3 + 0*2^2 + 1*2^1 + 1*2^0$$

$$1*-2^3 + 1*2^1 + 1*2^0$$

$$-2^3 + 2^1 + 2^0$$

$$-8 + 2 + 1$$

$$-5$$

This should be impressive! This simple two step process allows us to negate numbers incredibly quickly.

### Binary Subtraction as Addition

When I introduced binary, I showed how to add numbers but sneakily ommitted any discussion of subtraction. That was intentional, as I was waiting to introduce the concept of negative numbers before visiting this topic.

Suppose you are subtracting two numbers $$X$$ and $$Y$$. Then it should be pretty evident that $$X-Y = X + (-Y)$$. In English: "X minus Y is equal to X plus negative Y". So, to subtract Y from X, all you need to do is negate Y and add that value to X. So, instead of us having to devise a new algorithm for subtracting numbers in binary, we can use two algorithms that we already know: one being negation of a binary number and the other being addition of two binary numbers.

And it turns out, for reasons we won't concern ourselves with, addition in Two's Complement works out the exact same as the previously discussed algorithm in Chapter 3 (try add some combinations of positive and negative numbers if you don't believe me).

We will illustrate this topic with one problem: what is $$6_{10}-4_{10}$$ in binary? We know the answer is $$2_{10}$$ and can quickly convert that to binary and obtain $$0010_2$$, but let's work it out the long way for sake of illustration.

First, we convert 6 and 4 into binary to respectively obtain $$0110_2$$ and $$0100_2$$.

Then, we take our representation of 4 and negate it to get -4. We do that by inverting all the bits ($$1011_2$$) and adding 1 to get $$1100_2$$. 

We then add this to the representation of six to get $$0110_2+1100_2=0010_2$$ And we know that is the correct binary representation of 2! If you paid attention closely, you noticed how the left-most bit got carried out from being a 1 to a 0 which is pretty cool since that is how our final result is positive (as it should be).

### Understanding Unsigned vs Signed Binary Arithmetic

So now that you understand how to represent negative numbers in binary, there is a important distinction I want to make: unsigned vs signed binary numbers. 

Unsigned binary numbers are what you initially learned about in Chapter 3 where any binary value is either a representation of 0 or a positive integer. This means that for any given n-bit binary value, unsigned binary numbers represent integers from $$0$$ to $$2^{n-1}$$. These numbers **cannot** be negative. 

Conversely, signed binary numbers are what you just learned about. The best way to represent signed binary numbers are by using two's complement. Two's complement essentially allows us to represent negative numbers and positive numbers. It's the best of representing these numbers because it allows us to maximize how many different numbers we are able to represent using an n-bit binary value (so a 4-bit binary value will be able to represent 16 numbers) since it only can represent 0 in one possible way. The range of signed binary values (which will be used interchangeably with two's complement) for an n-bit binary value is from $$-2^{n-1}$$ to $$-2^{n-1}-1$$. 

*Aside: We only learned how to do subtraction with signed binary numbers to keep it simple. The computer we are building cannot do subtraction with unsigned binary numbers.*

The next part I want to explain will be pretty important in a few chapters when we start building our computer. We need to be able to detect if our arithmetic contains any errors. By now, you might have realized that either with unsigned binary values or signed binary values, we can only represent a certain range while doing addition or subtraction. Remember in Chapter 4 when we discussed how computers are unable to represent numbers outside of their scope (which you will soon understand why as you keep reading), this same idea applies to binary addition and subtraction. We can't magically represent numbers outside of our scope; so, when we get binary values which fall outside of our range, we call this an **error**. For example, if we are working with 4 bit numbers, we can represent the numbers 10 and 11, but the sum (22) cannot be represented in four bits! There are two seperate ways of detecting errors for unsigned binary numbers and signed binary numbers.

For unsigned binary numbers, we must look at the last carry-out from most significant (i.e. leftmost) bit to look for an error. So, let's look at the following expression: $$1000_2+1000_2$$. I know you probably know what the result is by now, but let's break it down for explanation sake:

| | Fifth Bit (Carry-Over) | Fourth Bit | Third Bit | Second Bit | First Bit |
|:--:|:--:|:--:|:--:|:--:|
| Carry Over | 1 |  |  |  |  |
| Number #1 | | 1 | 0 | 0 | 0 |
| Number #2 | | 1 | 0 | 0 | 0 |
| | 1 | 0 | 0 | 0 | 0 |

Before we begin dissecting this, I want you to keep in mind that we are adding 2 4-bit values, so our result should also be a 4-bit value. Now looking at the result, we can see that the result is actually 5 bits because there is a carry-over from the MSB (most sigificant bit). As mentioned earlier, since there is a carry-over from the MSB and the result has to be represented by more than 4 bits, we have an error. Easy right?

For signed binary numbers, the trick is actually a lot more straightforward. In order to detect an error, we look for **overflow**. All this means is that if we add two positive numbers and get a negative number as the result or if we add two negative numbers and get a positive number as the result, then we have an overflow. Let's look a quick example for the expression $$1011+1011$$:

| | Fifth Bit (Carry-Over) | Fourth Bit | Third Bit | Second Bit | First Bit |
|:--:|:--:|:--:|:--:|:--:|
| Carry Over | 1 |  |  |  |  |
| Number #1 | | 1 | 0 | 1 | 1 |
| Number #2 | | 1 | 0 | 1 | 1 |
| | 1 | 0 | 1 | 1 | 0 |

*Aside: With signed binary numbers, we can always ignore the fifth bit (or the carry-over from the MSB). You don't have to worry about the reason why, but the carry-over will not tell you much when doing signed arithmetic (addition or subtraction). Usually, you will see carry-overs while doing some sort of subtraction with two's complement, but again, you should ignore these.*

Now looking at our result, we see that it is **0110** and since the MSB is 0 (meaning it is positive), that means that there is overflow here since we added two negative numbers initially. Easy right?

Another quick note: we can never have overflow if we add a positive number and a negative number together (try it out)! 

I know this was a long explanation of what an error is when doing arithmetic, but it is very crucial you understand this as we move forward to building our computer. 

### Back to 8-Bit Numbers

You've made it. I've explained the vast majority of all the binary concepts we need to know before we can start designing our computer. The last thing I will do in this chapter, is reinstate our understanding of 8 bit values. Two's Complement works in 8-bit values as well. The left-most bit ($$2^7$$) has its value negated so its weight is $$-2^7$$ (so if the MSB position is 0, this number is positive; if the MSB position is 1, this number is negative). The other bit positions remain the exact same.

So, the smallest number we can represent in a byte using Two's Complement is $$1000\ 0000_2=-2^7_{10}=-128_{10}$$. 

The largest number we can represent is $$0111\ 1111_2$$ which equals, if you work it out, is $$127_{10}$$.

So, in a byte, we can represent any whole number in the range of $$[-128, 127]$$

That covers all we need to know before we can start moving on to the interesting stuff in the next chapter!

### Optional Section: One's Complement

In this chapter, we learned about the Sign-Magnitude and Two's Complement representations of signed binary values; however, there is one more representation that you will typically learn about in CS courses. This is called One's Complement.

One's Complement is fairly easily to understand and allows us to represent numbers in the range $$-(2^{n-1}-1)$$ to $$2^{n-1}-1$$ for any given n-bit value. You might have noticed something just from looking at this range, it means we cannot represent all $$2^n$$ values possible. The reason for this is because 0 is represented twice using One's Complement which is why it is not a good solution. Let's take an example of a nibble and show all the possible values using One's Complement:

| Number | Binary Value |
|:--:|:--:|
| 7 | 0111 |
| 6 | 0110 |
| 5 | 0101 |
| 4 | 0100 |
| 3 | 0011 |
| 2 | 0010 |
| 1 | 0001 |
| 0 | 0000 |
| 0 | 1111 |
| -1 | 1110 |
| -2 | 1101 |
| -3 | 1100 |
| -4 | 1011 |
| -5 | 1010 |
| -6 | 1001 |
| -7 | 1000 |

You might notice a pattern with all the numbers. For one's complement, we simply find the positive representation of the binary value as normal with a 0 added on as the MSB to indicate it is positive. To find the negative equivalent, we flip all the digits. Simple right?

As mentioned above, one's complement has two different binary representations of 0 making it an inefficient method. The issue of representing 0 twice may seem negligible, but when we scale this up to a modern computer that stores billions of bytes of data, this loss becomes meaningful.
