RSpec.describe GitlabHealthChecker do
  it "has a version number" do
    expect(GitlabHealthChecker::VERSION).not_to be nil
  end
  it "make choices" do
    expect (GitlabHealthChecker::GitlabHealthCheck.ping('3')).to eql("You have to choice 1 or 2")
  end
end
