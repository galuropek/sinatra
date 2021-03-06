require_relative 'time_period'
require 'pry'

class Task
  attr_accessor :name
  attr_accessor :description
  attr_reader :start_time
  attr_reader :elapsed_time
  attr_reader :time_periods
  attr_reader :active
  attr_reader :status

  def initialize(name)
    @name = name
    @time_periods = []
    @elapsed_time = 0
    @active = false
    @status = :empty
    @start_time = 'empty yet'
  end

  def start_stopwatch
    return if @active

    @current_period = TimePeriod.new
    @start_time = @current_period.start.strftime "%H:%M:%S" unless @status == :pause
    puts @start_time.inspect
    @active = true
    @status = :in_progress
    @time_periods << @current_period
  end

  def pause_stopwatch
    return unless @active

    @current_period.stop
    @active = false
    @status = :pause
    @current_period = nil
  end

  def stop_stopwatch
    if @status == :closed
      puts 'Something went wrong, stopwatch already is closed o_O'
    else
      @current_period.stop if @active
      @active = false
      @status = :closed
      @elapsed_time = calc_total_task_time
      puts @time_periods.map(&:total).inspect
    end
  end

  private

  def calc_total_task_time
    if @status != :closed
      puts 'Task not closed yet'
      return
    end

    @time_periods.map(&:total).sum
  end
end

# seconds = [2,3,4]

# task = Task.new('')
# task.start_stopwatch
# puts "sleep 1"
# sleep seconds.sample
# task.pause_stopwatch
# task.start_stopwatch
# puts "sleep 2"
# sleep seconds.sample
# task.pause_stopwatch
# task.start_stopwatch
# puts "sleep 3"
# sleep seconds.sample
# task.pause_stopwatch
# puts 'Stop watch'
# task.stop_stopwatch
# puts task.time_periods.map { |x| x.total }.inspect
# puts task.elapsed_time
