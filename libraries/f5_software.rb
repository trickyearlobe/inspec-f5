require_relative 'semver'

class F5Software < Inspec.resource(1)
  name "f5_software"

  # This one permits semver comparisons like
  # semantic_version > "16.1.1.1"
  def semantic_version
    SemVer.new(inspec.backend.platform.release)
  end

  # This one is just a plain String
  def version
    inspec.backend.platform.release
  end
end
