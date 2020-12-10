class TimePeriod
  attr_reader :start
  attr_reader :end
  attr_reader :total

  def initialize
    @start = Time.now
  end

  # set @total time in seconds
  def stop
    @end = Time.now
    @total = (@end - @start).round
  end
end
