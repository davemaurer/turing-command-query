#1. (Run tests) uninitialized constant LeatherChairTest::LeatherChair - LeatherChairTest is looking for a
# LeatherChair constant. A class is a constant, so I think I need a class called LeatherChair...
class LeatherChair
#2. (Run tests) Ok now it says undefined method faded? for #<LeatherChair:0x007fb6f1abd060>. That weird thing
# at the end #<LeatherChair:0x007fb6f1abd060> is the LeatherChair object I made. It's actually the current
# instance of the LeatherChair class that was created in line 9 of the test file. Cool. So that tells me the
# class LeatherChair needs a method named faded? The question mark just tells developers this is a method
# that returns a boolean. Just a style choice, not required, except in this case, since the test calls it
# with a question mark, it is mandatory to make the test pass. We will just add the empty method for now.
  def faded
# (Run tests) Woah! The test passed, with nothing in the method? That's because the test expects a refutation
# (line 10 of the test) which mean
  end
end
