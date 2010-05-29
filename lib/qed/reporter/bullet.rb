module QED
module Reporter #:nodoc:

  require 'qed/reporter/base'

  # = Bullet Point Reporter
  #
  # Similar to the Verbatim reporter, but does
  # not display test code for passing tests.
  class BulletPoint < BaseClass

    #
    def tag(step)
      case step.name
      when 'pre'
        # none
      when /h\d/
        io.puts "#{step.text}\n".ansi(:bold)
      when 'p'
        txt = step.text.to_s.strip.tabto(2)
        txt[0,1] = "*"
        io.puts txt
        io.puts
      end
    end

    def pass(step)
      #io.puts "#{step}".ansi(:green)
    end

    def fail(step, assertion)
      msg = ''
      msg << "  ##### FAIL #####\n"
      msg << "  # " + assertion.to_s
      msg = msg.ansi(:magenta)
      io.puts msg
      #io.puts
      io.puts "#{step.text}".ansi(:red)
    end

    def error(step, exception)
      raise exception if $DEBUG
      msg = ''
      msg << "  ##### ERROR #####\n"
      msg << "  # " + exception.to_s + "\n"
      msg << "  # " + clean_backtrace(exception.backtrace[0])
      msg = msg.ansi(:magenta)
      io.puts msg
      #io.puts
      io.puts "#{step.text}".ansi(:red)
    end

    #def report(str)
    #  count[-1] += 1 unless count.empty?
    #  str = str.chomp('.') + '.'
    #  str = count.join('.') + ' ' + str
    #  io.puts str.strip
    #end

    #def report_comment(step)
    #  txt = step.to_s.strip.tabto(2)
    #  txt[0,1] = "*"
    #  io.puts txt
    #  io.puts
    #end

    #def report_macro(step)
    #  txt = step.to_s.tabto(2)
    #  txt[0,1] = "*"
    #  io.puts txt
    #  #io.puts
    #  #io.puts "#{step}".ansi(:magenta)
    #end

  end #class Summary

end#module Reporter
end#module QED
