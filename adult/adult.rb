#1. Running test first time tells me uninitialized constant AdultTest::Adult. A class is a constant,
# so I need a class called Adult?
class Adult
#2. ok now it says undefined method sober?, with a question mark at the end. A method with a question
# mark at the end conventionally means it returns a boolean value (either true or false). It doesn't have to,
# but that makes it easier for other developers, and me, to figure out what the method is doing. so...
  def sober?
#3. hmmm the test result looks a little weird. Oh! That's because the test is written with the code execution BEFORE
# the expected result, which is perfectly fine, I'm just used to seeing it like:
# assert_equal "Adult ...", adult.sober?. So the test result is just telling me it wants to see that line. so...
    "Adult should really be sober right now." # ok now it passed. On to the next test.
  end
end
