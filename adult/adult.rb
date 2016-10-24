#1. Running test first time tells me uninitialized constant AdultTest::Adult. A class is a constant,
# so I need a class called Adult?
class Adult
#2. (Run test) ok now it says undefined method sober?, with a question mark at the end. A method with a question
# mark at the end conventionally means it returns a boolean value (either true or false). It doesn't have to,
# but that makes it easier for other developers, and me, to figure out what the method is doing. so...
  def sober?
#3. (Run test) hmmm the test result looks a little weird. Oh! That's because the test is written with the code
# execution BEFORE the expected result, which is perfectly fine, I'm just used to seeing it like:
# assert_equal "Adult ...", adult.sober?. So the test result is just telling me it wants to see that line. so...
    "Adult should really be sober right now."
# (Run test) ok now it passed. On to the next test. WOW, this one has a lot of assertions.
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
    "Yeah, OK. The adult is drunk"
  end
end


=begin
7. Here we will copy just the code from above to get a clear idea of what we have without all the comments
cluttering things up. And we will change the copy, and add more cluttering comments :).
Reading the second test, We've got the Adult instance calling the method: consume_an_alcoholic_beverage a
total of four times, and after each time, the test expects adult.sober? to return a different value. That
tells us a couple of things.
ONE: We will probably need a counter of some sort, because how else can we track when to change the message
     adult.sober? is returning?
TWO: We will need conditionals inside of our sober? method so we can return the different messages depending
     on how many times consume_an_alcoholic_beverage has been called.
Below is a copy of the code from above, without the comments. Then we will change it to match point ONE and TWO
above. If you have an editor that freaks out because you have two same-name classes in your file now, just comment
out the code above here. We will start our step numbers over at 1 also.
=end

class Adult
#1. create an initialize method to hold an @drink_counter instance variable. This allows us to track the number
# of drinks our Adult has. Go to 2 now, which is down below a little bit.
  def initialize
    @drink_counter = 0
  end

  def sober?
#3. Here is the tricky part with conditionals. We have a counter, so we can use that to decide which message to
# return. Since a method implicitly returns the last thing evaluated inside of it, we can use an if/else
# statement to tell Ruby to use puts to output a string depending on the @drink_counter count, and then at
# the end, we let Ruby do it's implicit return trick to evaluate the statement @drink_counter < 3. It will
# either be true or false, and will satisfy the test's assert or refute expectations (lines 16/19 or 22/25).
    if @drink_counter == 0
      puts "Adult should really be sober right now."
    elsif @drink_counter == 1
      puts "Still sober."
    elsif @drink_counter == 2
      puts "Not drunk yet."
    elsif @drink_counter == 3
      puts "Yeah, OK. The adult is drunk."
    elsif @drink_counter == 4
      "The adult doesn't get more sober from drinking more"
    end
    @drink_counter < 3
  end

  def consume_an_alcoholic_beverage
#2. Use the += operator on @drink_counter whenever this method is called. @drink_counter += 1 is just shorthand
# for @drink_counter = @drink_counter + 1. Now go up for 3.
    @drink_counter += 1
  end
end

#4. We could stop right here, because running the tests now gives us a green light, but that sober? method is
# actually doing more than just returning a boolean. It's name would be more aptly:
# check_sobriety_and_give_feedback, or something like that. The way the tests are written makes it hard to
# decouple the message from the boolean return, and this is one important part about programming. Unless you
# are working with a codebase that you are not allowed to alter, YOU decide how the tests are written in order
# meet your company/client goals. In this case, I would change the way the tests are worded, so I could have
# sober? check for the boolean, and another method called maybe check_sobriety that calls sober?, and also calls
# a sobriety_message method along with it, or just takes care of the messages itself. And that's just my opinion.
# You are free to do it a different way if you like. Sober? could also call a give_message method that handles
# the puts statements, thus making that method a little smaller and separating responsibilities a bit. Again
# it's your choice. 
