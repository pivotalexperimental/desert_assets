class SpecSuite
  def files
    dir = File.dirname(__FILE__)
    Dir["#{dir}/../spec/**/*_spec.rb"]
  end

  def run
    dir = File.dirname(__FILE__)
    ARGV.concat ["--options", "#{dir}/spec.opts"]

    files.each do |file|
      require file
    end
    result = ::Spec::Runner::CommandLine.run
    exit result
  end
end

if $0 == __FILE__
  SpecSuite.new.run
end
