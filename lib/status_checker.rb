require_relative "status_checker/version"
require_relative "status_checker/status_checker"

StatusChecker::StatusChecker.get_status("https://about.gitlab.com")