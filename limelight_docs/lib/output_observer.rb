class OutputObserver < IO

  Newline_regex = /\n|\r\n/

  attr_reader :buffer
  attr_accessor :action

  def initialize
    super(1, 'w')
    @buffer = ""
  end

  def infiltrate!(&action)
    @action = action
    $stdout = self
  end

  def retreat!
    $stdout = STDOUT
    report_lines
    action.call(@buffer) if @buffer.length > 0
    @buffer = ""
  end

  def write(c)
    @buffer << c
    report_lines
  end
  
  def report_lines()
    while match = Newline_regex.match(@buffer)
      break if match.pre_match.length == 0
      @action.call(match.pre_match) if @action
      @buffer = match.post_match  
    end
  end

end