---
title: Chapter 3
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

# Chapter 03 - The Language of Computers. Meet Binary
**Topics Covered:** Base-2 Introduction, Binary Addition, Counting in Binary

### Why Computers Cannot Understand Decimal

We are now ready to move on and understand how computers represent numbers. Everything so far has formalized the concept of Base 10, but for reasons that will eventually become apparent, computers cannot (easily) be built in the physical world to represent numbers the same way we do. Why not? Before I briefly explain, I would like to specify that I am no electrical engineer and any rational electrical engineer will probably label this justification as critically flawed. But, we are already operating at a low enough level, and if we went any deeper, then we would be dealing less with computer science and more with physics. Long story short, at some point, engineers have to actually build the computers they design. One ingenous idea is that we can detect the prescense or absence of electricity relatively easy (suppose we are talking about electricity on a wire). With that in mind, engineers decided to let the absence of electricty be interpreted as a 0 and the presence of electricity be represented as a 1. With these two numbers, computers have enough resources to count in 'Base 2' which is synonymous with 'Binary'.

You might be thinking, if engineers could detect the absence and presence of electricity on a wire, why could they also not detect the amount of electricity present. They could then say that no electricity at all is 0, a little bit of electricity can be interpreted as 1, a little more can be interpreted as 2, and so on, with the most amount of electricity being represented as a 9. This would effectively enable computers to count in decimal. However, it turns out that in the physical world, it is really difficult to maintain an exact 'amount' of electricity on a wire. The 'amount' of electricity on a wire can waver significantly which makes this process useless. If anything in this paragraph was slightly confusing, you don't need to worry about it. That topic transcends the scope of information I wanted to cover in this series but thought it would be worth discussing to motivate the 'Why' aspect of only having 0s and 1s.

### Binary/Base-2

So, if you take my word that we can use the presence of electricity to represent 0's and 1's when we are talking about electricity on a wire, then we are good to move forward. A first question: If we only have the digits 0 and 1 available, why are you calling this Base 2? Well, in base-10 (i.e. the human language), we only have the digits 0 through 9 available but we call it base-10 not Base-9. The idea being that base-K means you can have K different values in any digit position. Or equivalently stated: A digit in 'Base K' can take on values from 0 up to K-1. So, with just 0's and 1's, there are only two different values that can occupy any digit position, so we call this Base-2.

So what do numbers look like in base 2? To give you a complete answer, I will pose and then answer the following four questions. After reading and understanding the answers to each of these questions, you will know all you need to understand the black-box that is currently Binary.

1. How do you convert numbers from Base-2 to Base-10
2. How do you convert numbers from Base-10 to Base-2
3. How do you add two Base-2 numbers
4. What does counting look like in Base-2

### Converting Numbers from Base-2 to Base-10
Any combination of 0's and 1's is a valid number in base 2 (Similarly, any combination of the digits 0-9 is a valid number in base 10). Lets consider the binary number $$1101_{2}$$. Earlier, I mentioned that I would subscript all numbers in base-10 with a 10, so I will also subscript any base-2 numbers with a 2. Let me answer the question by giving a long form representation of $$1101_{2}$$.

$$1101_{2} = 1*2^3 + 1*2^2 + 0*2^1 + 1*2^0$$

Hopefully, this reminds you of the long-form expression from the start of this chapter when we decomposed $$845_{10}$$. Let me copy that below.

$$845_{10}=8*10^2+4*10^1+5*10^0$$

If you read over both of these expressions and recall the painfully obvious facts that I laid out earlier, you can see that the only difference between base-2 and base-10 is the value of the base in the exponentiated terms of the sum (does that explain where the word 'base' comes from!). In decimal, each of the digit places was representing a different power of 10: the ones places, tens place, hundreds place, thousands place, etc. In binary, each of the digit places is representing a different power of 2: one ($$2^0$$), two ($$2^1$$), four ($$2^2$$), eight ($$2^3$$), sixteen ($$2^4$$), thirty-two ($$2^5$$), etc.

So, lets take $$1101_{2}$$ and start with the right-most digit. The first power of 2 is 0 and $$2^0=1$$, so we multiple the value of that digit position, 1, by this power of 2: $$1*1=1$$. We will now do the same thing for each of the digit positions, sum up their results, and the final sum will be the decimal (i.e. the recognizable) interpretation of that number. 

Let's move to the next digit position (the second-from-the-right): the value in this spot is 0 and the next power of 2 is $$2^1=2$$. The product of these two values is $$0*2=0$$. 

Then we move onto the next digit position: the value in this spot is 1 and the next power of 2 is $$2^2=4$$. The product of these two values if $$1*4=4$$. 

Then we move onto the last digit position: the value in this spot is 1 and the next power of 2 is $$2^3=8$$. The product of these two values is $$1*8=8$$.

Lastly, we add together each of the values we computed for each of the digit positions which, in the order from right to left, is: $$1 + 0 + 4 + 8 = 13$$. And we did it! The binary number $$1101_{2}$$ which originally had no easily interpretable value, has now been deciphered as the decimal number 13. So we have that $$1101_{2}=13_{10}$$.

It doesn't get more complicated than that! Let's spell this out in steps:
1. Start at the right-most digit position
2. Let sum = 0 and base = 0
3. Multiple the current digit position by $$2^{base}$$
4. Add the result of Step 3 to sum
5. If there is another digit to process, base = base + 1 and then go back to step 3 considering the next digit position to the left.

Let's use these steps to work through one more example. Convert the value $$1010101_{2}$$ to Base-10. Try work this out for yourself. I will give the expanded out version instead of showing all the steps, but you should get the same result by following the steps above.

$$1010101_{2} = 1*2^6 + 0*2^5 + 1*2^4 + 0*2^3 + 1*2^2 + 0*2^1 + 1*2^0$$

When you simplify the right hand side of the expression (all of the values on the right side are in decimal), you will find that $$1010101_{2}=85_{10}$$

Here's the familiar table from the previous section, but with the current example and specified in base-2

|   | 1 | 0 | 1 | 0 | 1 | 0 | 1 |
|---|---|---|---|---|---|---|---|
| Weight of Position Expressed as a Power of Two  | $$2^6$$  | $$2^5$$  | $$2^4$$  | $$2^3$$  | $$2^2$$ | $$2^1$$ | $$2^0$$
| Weight of Position Expressed as a number  | 64 | 32 | 16 | 8 | 4 | 2 | 1

And with that, you now know to follow the basic steps above to convert numbers from the mysterious base-2 to the easily understandable base-10. This is not something to take lightly, it's remarkable that a random string of 0's and 1's makes no sense to us until we are able to convert it to decimal, and then we understand all there is about that number. For example, we immediately know that $$\$10_{10}$$ is a low amount of dollars to pay for a new shirt, but we cannot say the same about $$\$10110_{2}$$ with the same congitive ease. In the second scenario, you have to convert the binary number to base 10 to make any sense of it. However, as we will learn in the process of building a computer, CPU's have no understanding of numerical representation besides base-2. Whenever we are using a computer to perform arithmetic, we type in the input in base 10, but the values are immediately converted to base 2, the operations happen in base 2, and then the very last step is to return the result in base 10 so that us humans can understand it. But the average person has no idea all of that is happening under the hood, but now you do.

One remark: In formalizing base-10, we multiplied each digit position's weight (some power of 10) by the value of the digit in the corresponding position. In binary, the value of a digit in any position is either 0 or 1. So, if we have a 1 in a position, we simply add the corresponding power of 2 to our running total (since multiplying the weight by 1 is just the weight itself). Similarly, if we have a 0 in a position, we can simply ignore that position and move onto the next since there is no need to multiply by the corresponding position weight since any number multiplied by 0 is 0.

### Converting Numbers from Base-10 to Base-2
Converting a base 10 number to a base 2 number is a bit more difficult of a task for it doesn't always feel intuitive, but the process can be reduced down to an easy set of steps. This sub-section may feel difficult to understand, and that is normal and will take lots of practice to fully grasp. The good part is that you can feel free to skip this subsection if you would like, since in the future chapters of this book, I will do the conversion for you. For those who remain curious, I will explain the conversion process in a more mathy manner. 

The question I will answer in this section: what is $$145_{10}$$ in binary? To answer this question, I will lay out the steps for the conversion algorithm and then we will use the algorithm to convert $$145_{10}$$

To convert the value $$X_{10}$$ to binary
1. Start with an empty string which will be the answer = ''
2. Divide X by 2
3. If the remainder of step 2 is 1, prepend a 1 to answer
4. If the remainder of step 2 is 0, prepend a 0 to answer
    (Note that the remainder can only be 0 or 1 since we are dividing by 2)
5. X = X/2 (Rounding down in the case of a remainder)
6. If X is not zero then go to step 2

You do not need to understand why this algorithm works since it requires a strong intution of binary that you probably won't have if this is your first time being introduced to the concept.

Let's work through the example following the steps
1. answer = ''
2. 145/2 = 72.5
3. answer = '1'
4. X = 72
2. 72/2 = 36
4. answer = '01'
5. X = 36
2. X/2 = 18
4. answer = '001'
5. X = 18
2. X/2 = 9
4. answer = '0001'
5. X = 9
2. X/2 = 4.5
3. answer = '10001'
4. X = 4
2. X/2 = 2
4. answer = '010001'
5. X = 2
2. X/2 = 1
3. answer = '0010001'
5. X = 1
2. X/2 = 0.5
3. answer = '10010001'
5. X=0
6. Stop

Therefore, we have $$145_{10}=10010001_2$$. You can verify this by using what you learned in the previous seciton to convert the binary number back to decimal and you should get $$145_{10}$$


### How do you add two Base-2 numbers
Let's recall how we would add two numbers in decimal, say $$780$$ and $$956$$. We start with the right-most digit position, and add the two numbers. If the result is less than 10 (base-10 sounding familiar?), then we simply put the sum as the first digit in the resulting sum. If the sum does exceed ten, then we put the sum's remainder when you subtract 10 as the first digit of the resulting sum. Since we carry over, then in the next digit position, we add 1 to the sum of the next two values. We then repeat these steps over and over until we have added all the digits in the corresponding positions. If one value has more digits then the other, we can zero pad the shorter of the two values (i.e. $$567+4=567+004$$). Lastly, if we get to the end, and the final sum carry's over, then we add a new left-most digit position to our result and give it the value of 1. 

In our example, $$0+6=6$$ and since $$6<10$$, we mark the first digit of our result (i.e the right-most digit also known as the *least significant digit*) as 6. Then, we consider the next digit position and add $$5+8=13$$. Since $$13>10$$, we let the position of the result by $$13-10=3$$ and then note the carry over. When we look at the next digit position, we add $$7+9+1=17$$ (the 1 appears from the carry over of the previous digit position). Since $$17>10$$ we let the corresponding digit position of our result by $$17-10=7$$. Now, although there are no more digit positions left to sum, our final (most significant) digit position, had a carry over, so we must account for that. You can think of this as one final sum, where the two values are 0, as shown in the table below. In that case we add $$0+0+1=1$$ which means we have a $$1$$ in the left-most digit position of our result. It is safe to prepend these 'fake' zeroes to our numbers under addition because adding zeroes to the front of a number does not change its intrinsic value.

| Computing X+Y  |   |   |   |   |
|---|---|---|---|---|
| X | 0 | 7 | 8 | 0 |
| Y | 0 | 9 | 5 | 6 |
| Sum | 1 | 16+1=17 | 13 | 6 |
| Carry | No | Yes | Yes | No
| Result| 1 | 7 | 3 | 6

The concept of carry-over should sound familiar from elementary school, but it is also valuable to understand why we carry over in the first place and why we choose the value 1. This will be explained in the next sub-section. Revisit this after reading that section and this should make sense.

If this all makes sense, then adding numbers in binary should be easy since it follows the same exact process. The only difference, is that in base-2 we carry over when the sum in a digit position is greater than or equal to 2. Similarly, you know that in base-10 we carry over when the sum in a digit position is greater than or equal to 10. 

In general: 
 1. You carry over in base-k when the sum in a digit position is greater than or equal to k. 
 2. In that case, the digit you leave in the current position is the remainder of the sum when divided by k.

Let's try add the following binary numbers $$101_2$$ and $$1_2$$. The first thing I will do, as seen in the table below, is to zero pad the shorter number so the two digits are the same length. This doesn't change the value, but makes 'stacking' the numbers more visually intuitive for the sake of me explaining. Now we are computing $$101_2 + 001_2$$. Just like decimal, we start with the least significant digit position and then work towards the most significant digit position (i.e. right to left). $$1_2+1_2=2_{10}$$. This is a carry-over because we only have 0's and 1's in binary, so we can't find a 2 into any digit position (this is formally explained by the two rules listed above). So, we leave a 0 in this digit position of the sum (Rule 2) and mark our carry as 1. Then, we look at the next digit position and add $$0_2+0_2+1_2=1_{10}=1_{2}$$. So, the next digit position of our result is 1 since there is no carry. Then the next position we add $$1_2+0_2=1_2=1_{10}$$ and there is once again no carry, so the corresponding digit in the result is 1. This gives us the answer $$110_2$$!

I will paste the same exact table as from above but for this example, with the difference being that this is binary arithmetic instead of decimal arithmetic. You can verify by converting the two values to decimal and then asserting that the sum of their decimal values is the same value you get when you convert their binary sum, $$110_2$$, to decimal.

| Computing X+Y  |   |   |   |
|---|---|---|---|
| X | 1 | 0 | 1 |
| Y | 0 | 0 | 1 |
| Sum | 1 | 1 | 2
| Carry | No | No | Yes
| Result| 1 | 1 | 0

For any digit position, we are adding a combination of 0's and 1's (ignoring the carry which you do have to consider). We can specify the outcomes in a table as given below.


| A+B | Sum | Carry Out |
|---|---|---|
| 0+0 | 0 | 0  |
| 0+1 | 1 | 0  |
| 1+0 | 1 | 0  |
| 1+1 | 0 | 1  |

If we wanted to extend this table to include the carry component, we can.


| A+B+Carry In | Sum | Carry Out |
|---|---|---|
| 0+0+0 | 0 | 0  |
| 0+0+1 | 1 | 0  |
| 0+1+0 | 1 | 0  |
| 0+1+1 | 0 | 1  |
| 1+0+0 | 1 | 0  |
| 1+0+1 | 0 | 1  |
| 1+1+0 | 0 | 1  |
| 1+1+1 | 1 | 1  |


Verify that each entry in this table makes sense, and you have a complete understanding of adding binary numbers.

The equivalent table could be specified for decimal numbers, but would have too many entries to show here. For sake of illustration, I will include such a table, but with only a few entries to highlight key ideas

| A+B+Carry In | Sum | Carry Out |
|---|---|---|
| 1+2+1 | 3 | 0  |
| 9+1+0| 0 | 1  |
| 9+9+0 | 8 | 1  |
| 9+9+1 | 9 | 1  |

Notice how in both decimal and binary, the value of the carry can never be more than one (it is either always zero or one). If this result doesn't make sense, try find two decimal digits whose sum would have a carry greater than one, and when you are unable to do so, it should become evident. It turns out this property holds for any base.

### What does counting look like in Base-2

In both base-2 and base-10, we can think of counting as starting with the number 0, and continuining to add 1 to the result of the last sum.

Given that you know how to add numbers in binary, this section won't be too long since you already know how to add 1 to any value. But, there are a few worthwile takeaways. When we count in decimal, we take the number we currently have and keep attempting to increment (add one) to the least significant digit position. In some cases this will work: $$8\rightarrow9, 95\rightarrow96,245\rightarrow246$$. However, in some instances, this won't work. For example in $$49$$, we can't simply increment the 9 to a 10 since 10 requires two digit positions and we only have 1 to work with. So, we roll over the 9 to a 0 and add a 1 to the next digit position. That is we roll the 9 in 49 to yield 40 and then try increment the next digit position from a 4 to a 5 which yields us the result of 50. Let's briefly think about why we carry over one. This might be obvious to some and less clear to others. If we have a 9 in the current digit position and we want to get to the next number, we have an issue with adding 1 to the number. However, we can accomplish the same result by simultaneously adding ten to the number and subtracting 9. Formally put, for some $$X$$, $$X+1=X+10-9$$. And that is exactly what we are doing when we count, when we roll the 9 to a 0, we are subtracting 9 from $$X$$, and when we are adding a 1 to the next digit position, that is synonymous with adding 10 to X. 

And this works for any digit position. For example, if we are counting and are currently at 499, we know that we roll the first 9 to a 0 and add a one to the next digit position. Since the second digit position is also a 9, this will result in another carry over and in this case, rolling the 9 to a 0 and adding a 1 to the next most significant digit position can be verified by the fact that $$X+1 = X-99+100 = X-9*10^1 + 1*10^2$$. This should hopefully explain where the 9 and 1 come from in our process. 

Now in binary, the same process happens, but we rollover whenever we get to a point where a digit position would have a two in it if we were to increment it. So $$0_2\rightarrow1_2$$. Then adding a 1 to this would carry so we get, $$(01_2=1_2)\rightarrow 10_2$$. The carrying over can happen multiple times: $$011_2\rightarrow100_2$$. Similarly, $$1111_2\rightarrow10000_2$$.

#### Digression 
There is one final remark that I will make related to counting. Just as everything so far in this chapter is seemingly random, the next idea will also appear to be purposeless until many chapters down the road. 

Let's jump back to the familiar base-10 and suppose we are interested in knowing how many different values we can store in a fixed number of digit positions. Suppose you are asked how many different numbers you can represent with a single digit. You intuitively know the answer already, but we can formally solve this by enumerating all of the 1 digit numbers and then seeing how many we have: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9. This is ten different numbers (don't fall into the trap of believing the answer to be 9 because there are actually 10 digits in the range [0, 9]). Easy enough, but now suppose I ask you how many numbers you can represent with two digits. You know the smallest two digit number is 0 and the largest two digit number is 99, so you can easily answer with 100 because you know that there are 100 numbers in the range of [0, 99] (once again don't fall into the trap of thinking 99 is the answer. There are 99 numbers in the range [1,99] but 100 numbers in the range [0,99]). It turns out, in base 10, this question is easy to answer for any number digit positions. All you need to do is count the number of digits between 0 and the largest value you can represent with the given number of digits.

The method we described is entirely correct, but is a less formal way of getting to the correct answer. Let's revisit the same question: how many numbers can you represent with two digits. The more mathematical way to answer this question is as follows. In the right-most digit position, there are ten values we can pick from: [0,9]. If we fix that digit position to some value along the range [0,9], then there are ten values we can pick for the other digit position, namely [0, 9]. In summary, if we fix one of the digit positions to a particular value, then we have ten different options for the other digit position. But for the first digit position, we can fix it to one of ten different values. So, if we can pick 1 of 10 values for the first position AND we know that for each selection, we can generate 10 different values for the second digit, then we can multiply these two numbers together to get our final answer $$10*10=100$$. In short, there are 10 options for the first slot, and for each of these 10 options, we can generate 10 unique numbers (based on what we put in the remaining digit slot), so it makes sense to multiply these two numbers to count the total number of possible values.

If we know there are 100 values we can represent with two digit positions, and we want to know how many values we can represent with 3 digit positions, we can use the same concept combined with our previous result. For each of the 100 values we can represent with two digits, there are 10 different values we can pick for the third digit that would each generate a new number. For example, for the two digit number $$45$$, we can generate each of the following unique three digit numbers: $$045$$, $$145$$, $$245$$, $$345$$, $$445$$, $$545$$, $$645$$, $$745$$, $$845$$, $$945$$. So, the same logic tells us that we should multiply our 100 known two-digit values by the 10 different options each number could select for the third new digit to get $$100*10=1000$$. 

Our Results:

1. In base 10, with 1 digit we can represent $$10$$ different values
2. In base 10, with 2 digits we can represent $$10*10=10^2=100$$ different values
3. In base 10, with 3 digits we can represent $$10*10*10=10^3=1000$$ different values

In general: In base 10, with K digits we can represent $$10*10*...*10=10^k$$ different values

We can then perform a similar analysis on base two. With 1 digit, our options are 0 or 1, so there are 2 different values we can represent with two digits. With two digits, we can enumerate the different values as $$00$$, $$01$$, $$10$$, $$11$$ which yields four different values. With three digits, we use the fact that there are 4 different values we can represent with two digits. For each of these values, we can obtain a three digit number by adding in a 0 or 1 for the new digit posiiton. This means there are $$2*4=8$$ values we can represent with three digits.

Our Results:

1. In base 2, with 1 digit we can represent $$2$$ different values
2. In base 2, with 2 digits we can represent $$2*2=2^2=4$$ different values
3. In base 2, with 3 digits we can represent $$2*2*2=2^3=8$$ different values

In general: In base 2, with K digits we can represent $$2*2*...*2=2^k$$ different values

This result will prove to be very useful down the road when we design our computer, but for the immediate time being, we will not use this takeaway.


At this point, you understand everything you need to know about binary to move on to designing the computer.
