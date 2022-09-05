class SemVer
  include Comparable

  # Convert incoming dotted string to array of integers
  def initialize(version)
    @version = version
  end

  # Convert array of integers back to dotted string
  def to_s
    @version
  end

  # Dirty trick to stop Inspec displaying nasty struct in DIFF's
  def inspect
    "\"#{@version}\""
  end

  def <=>(other)
    segments(@version) <=> segments(other)
  end

  def segments(dotted)
    dotted.split('.').map{ |s| s.to_i }
  end

  def major
    segments[0]
  end

  def minor
    @version[1]
  end

  def patch
    @version[2]
  end
end