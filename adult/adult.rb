#1. Running test first time tells me uninitialized constant AdultTest::Adult. A class is a constant,
# so I need a class called Adult?
class Adult
#2. (Run test) ok now it says undefined method sober?, with a question mark at the end. A method with a question
# mark at the end conventionally means it returns a boolean value (either true or false). It doesn't have to,
# but that makes it easier for other developers, and me, to figure out what the method is doing. so...
  def sober?
#3. (Run test) hmmm the test result looks a little weird. Oh! That's because the test is written as a straight
# refutation, without expecting something to equal anything or not equal anything. The message after the comma
# is the message that will be displayed if the test does not pass. So to make this pass, if line 9 of the test
# says assert adult.sober?, it just wants it to return true. So:
    true
# (Run test) ok now it passed. On to the next test. WOW, this one has a lot of assertions, and refutations.
#4. (Unskip and Run) First error is undefined method consume_an_alcoholic_beverage for #<Adult:0x007fd063201260>.
# What's that last thing all about? #<Adult:0x007fd063201260> is the instance object for the Adult class
# created by the test when it did adult = Adult.new. The identifier 0x007fd..... will change for each instance.
# It's like a finger print. Ok so I need a method...BUT, not inside of this sober? method right? I need to go
# outside of/down past this end down here.
  end
  def consume_an_alcoholic_beverage
#5. (Run test) Now the test result says it wants the line starting with "Yeah, OK...", but it wants that line
# when calling (activating) the method sober? on adult (adult right now is a local variable that references the
# current instance of the Adult class (Adult.new made that instance)). So now it would be good to start looking
# at what this test is doing, and determine how to change our current code to make it pass. Meet me down below
# at number 7.
  end
end


=begin
7. Here we will copy just the code from above to get a clear idea of what we have without all the comments
cluttering things up. And we will change the copy, and add more cluttering comments :).
Reading the second test, We've got the Adult instance calling the method: consume_an_alcoholic_beverage a
total of four times, and after each time, the test expects adult.sober? to either be asserted, or refuted. In
plain english it just wants the method to return a boolean value (true, or false).
That tells us a couple of things.
ONE: We will probably need a counter of some sort, because how else can we track whether the method sober?
     resolves to true or false? We can't just say one of the other, because it's different depending on how
     many drinks the adult has had.
TWO: We will need a conditional statement inside of our sober? method so we can return the correct boolean value
     once the adult has enough drinks to make them not sober.
Below is a copy of the code from above, without the comments from above. We will change it to make points
ONE and TWO above happen. If you have an editor that freaks out because you have two same-name classes in your
file now, just comment out the code above here. We will start our step numbers over at 1 also.
=end

class Adult
#1. create an initialize method to hold an @drink_counter instance variable. This allows us to track the number
# of drinks our Adult has. Go to 2 now, which is down below a little bit.
  def initialize
    @drink_counter = 0
  end

  def sober?
#3. Here is the tricky and also neat part with conditional statements. We have a counter, so we can use that
# to decide when the adult stops being sober, right? And looking at the test, it seems that at drink number
# three, adult.sober? should be refuted (line 22 in the test).
# Since a method implicitly returns the last thing evaluated inside of it, we can use a statement that Ruby
# will evaluate. If you just make a statement, like 10 < 5, in irb in your terminal, you will see that Ruby
# evaluates it and gives you it's conclusion in boolean form. Either true, or false. So can we just state in
# our method that the adult has had less than three drinks, and let Ruby implicitly return our boolean value
# for us? I think we can.
    @drink_counter < 3
  end
#(Run tests) Bam! They pass, because each time we call consume_an_alcoholic_beverage we increment the
# @drink_counter instance variable, and because it's an instance variable, it remembers it's value when
# we make the statement @drink_counter < 3 in the sober? method. Once the method consume_an_alcoholic_beverage
# is called three times, @drink_counter < 3 is a false statement, and sober? returns...false! The longer way to
# write that would have been: (commented out so it doesn't mess up the code)
  # def sober?
      # if @drink_counter < 3
          # true
      # else
          # false
      # end
  # end

  def consume_an_alcoholic_beverage
#2. Use the += operator on @drink_counter whenever this method is called. @drink_counter += 1 is just shorthand
# for @drink_counter = @drink_counter + 1. Now go up for 3.
    @drink_counter += 1
  end
end

