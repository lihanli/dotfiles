require 'progressbar'
require 'bigdecimal'

SLEEP_SECONDS = ARGV[0].to_s
progressbar = ProgressBar.create

(BigDecimal(SLEEP_SECONDS) / 100).tap do |increment|
  100.times do
    sleep(increment)
    progressbar.increment
  end
end

system('powershell.exe', '-c', "(New-Object Media.SoundPlayer 'Z:\\home\\lihan\\dotfiles\\scripts\\ruby\\lihan_timer\\alert.wav').PlaySync();")
