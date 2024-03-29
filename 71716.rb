# Welcome to Sonic Pi v2.10
use_bpm 125
define :drum do
  sample :drum_bass_soft,amp:2,attack:0.01,release:0.1
  sleep 1
  sample :drum_snare_soft,amp:2,attack:0.01,release:0.1
  sleep 1
end

define :hi_hat do
  sample :drum_cymbal_hard,amp:1
  sleep 1
end


define :jianzhoudrum do
  
  sample :drum_bass_soft,amp:3
  sleep 1
  sample :drum_snare_soft,amp:3
  sleep 1
  sample :drum_bass_hard,amp:3
  sleep 0.5
  sample :drum_bass_soft,amp:3
  sleep 0.5
  sample :drum_snare_soft,amp:3
  sleep 1
  
end

define :maintojianzhoudrum do
  use_synth_defaults amp:4
  sample :drum_bass_soft
  sleep 1
  sample :drum_bass_soft
  sleep 1
end

define :baseline do
  
  use_synth :fm
  play_pattern_timed [:c3,:c3,:c3], [1.5,0.5,2], amp:0.5,attack:0.01,release:0.05
  ##| sleep 2
  
  play_pattern_timed [:f2,:f2,:f2], [1.5,0.5,2], amp:0.5,attack:0.01,release:0.05
  ##| sleep 2
  
  ##| use_synth :dsaw
  ##| play_pattern_timed [:b2,:c3,:c3],[0.5,0.25,0.25],  amp:0.8, attack:0.01,release:0.8
  ##| sleep 1
end

define :baseline2 do
  
  use_synth :fm
  play_pattern_timed [:g2,:g2,:g2,:g2,:g2,:g2,:g2,:g2], [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5], amp:0.8,attack:0.01,release:0.3
  play_pattern_timed [:g2,:g2,:g2,:g2,:g2,:g2,:g2,:g2], [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5], amp:0.8,attack:0.01,release:0.3
  ##| sleep 2
  
  play_pattern_timed [:f2,:f2,:f2,:f2,:f2,:f2,:f2,:f2], [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5], amp:0.8,attack:0.01,release:0.3
  play_pattern_timed [:f2,:f2,:f2,:f2,:f2,:f2,:f2,:f2], [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5], amp:0.8,attack:0.01,release:0.3
  ##| sleep 2
  
  ##| use_synth :dsaw
  ##| play_pattern_timed [:b2,:c3,:c3],[0.5,0.25,0.25],  amp:0.8, attack:0.01,release:0.8
  ##| sleep 1
end

define :jianzhouchord do
  ##| use_synth_defaults attach:0.1,release:7,amp:2
  ##| play_chord [:c5,:e5,:g5]
  ##| sleep 8
  ##| play_chord [:a5,:c5,:f5]
  ##| sleep 4
  use_synth_defaults attach:0.1,release:6,amp:2
  play_chord [:e5,:f5,:g5,:b5]
  sleep 8
  play_chord [:d5,:f5,:a5,:c4]
  sleep 4
end

define :side do
  sleep 9.5
  with_fx :reverb ,room:0.2 do
    use_synth :blade
    play_pattern_timed [:c3,:c3,:c3,:c3,:c3],[0.25,0.25,0.25,0.25,1.5],amp:1,pan:rrand(-0.5,0.5)
    sleep 1.5
    play_pattern_timed [:c3,:c3,:c3,:c3,:c3],[0.25,0.25,0.25,0.25,1.5],amp:1,pan:rrand(-0.5,0.5)
  end
  
end


in_thread delay:64 do
  1.times do
    side
  end
end



define :gitar do
  sleep 2
  use_synth_defaults amp:1
  use_synth :dsaw
  play_pattern_timed [0.5,0.25,0.25]
end

define :jianzhouchord do
  
  sample :guit_e_slide
  use_synth :dpulse
  play_chord [:e5,:f5,:g5,:b5],attack:0.02,release:5
  sleep 4
  sleep 4
  
  sample :guit_e_slide
  use_synth :dpulse
  play_chord [:d5,:f5,:a5,:c4],attack:0.02,release:5
  
end
in_thread delay:48 do
  1.times do
    jianzhouchord
  end
end


define :frontend do
  use_synth :beep
  play_pattern_timed [:b4,:c5,:b4,:c5],[0.5,1,0.5,2]
  play_pattern_timed [:b4,:c5,:b4,:c5,:g4,:a4],[0.5,1,0.5,1,0.5,0.5]
  sleep 8
  
  play_pattern_timed [:b4,:c5,:b4,:c5],[0.5,1,0.5,2]
  play_pattern_timed [:b4,:c5,:d5,:e5,:a4,:c5],[0.5,1,0.5,1,0.5,0.5]
  sleep 8
  
  play_pattern_timed [:b4,:c5,:d5,:e5],[0.5,1,0.5,2]
  play_pattern_timed [:b4,:c5,:d5,:e5,:a4,:c5],[0.5,1,0.5,0.5,1]
  sleep 4
  
  sleep 1.5
  play_pattern_timed [:g3,:a3,:c4,:d4,:e4], [0.5,0.5,0.5,0.5,0.5]
  sample :guit_e_slide
  use_synth :dpulse
  play_chord [:e5,:f5,:g5,:b5],attack:0.02,release:5
  sleep 4
  sleep 1.5
  use_synth :beep
  play_pattern_timed [:e4,:d4,:c4,:d4,:e4], [0.5,0.5,0.5,0.5,0.5]
  sample :guit_e_slide
  use_synth :dpulse
  play_chord [:d5,:f5,:a5,:c4],attack:0.02,release:5
  sleep 8
  
  play_pattern_timed [:d5,:e5,:d5,:e5],[0.5,1,0.5,2]
  play_pattern_timed [:d5,:d5,:e5,:c5,:g4,:a4],[0.5,1,0.5,1,0.5,0.5]
  sleep 8
  
  play_pattern_timed [:d5,:e5,:g5,:e5],[0.5,1,0.5,2]
  play_pattern_timed [:d5,:d5,:e5,:d5,:c5,:c5],[0.5,1,0.5,1,0.5,0.5]
  sleep 4
  
  sleep 2.5
  use_synth :beep
  play_pattern_timed [:c5,:d5,:c5],[0.5,0.5,0.5]
  play_pattern_timed [:g5,:e5] , [2,2]
  play_pattern_timed [:g5,:f5,:e5,:d5,:c5,:d5,:c5] ,[0.5,0.5,0.5,1,0.5,0.5,0.5]
  play_pattern_timed [:g5,:e5] , [2,2]
  play_pattern_timed [:g5,:a5,:c5,:d5,:c5,:d5,:c5] ,[0.5,0.5,0.5,1,0.5,0.5,0.5]
  play_pattern_timed [:e5],[4]
  sleep 2.5
  play_pattern_timed [:c5,:e5,:c5],[0.5,0.5,0.5]
  play_pattern_timed [:d5],[8]
  
  loop do
    sleep 1.5
    play_pattern_timed [:g3,:a3,:c4,:d4,:e4], [0.5,0.5,0.5,0.5,0.5]
    sleep 4
    sleep 1.5
    play_pattern_timed [:e4,:d4,:c4,:d4,:e4], [0.5,0.5,0.5,0.5,0.5]
    #56123 32123, 56123, 34345, 32123,34345
    sleep 4
  end
end

define :gitargaochao do
  with_fx :reverb,mix:0.2,room:0.3,amp:0.5 do
    use_synth_defaults amp:0.5
    use_synth :supersaw
    play_pattern_timed [:e4,:c4,:e4,:c4,:e4,:c4,:e4,:c4],[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
    play_pattern_timed [:e4,:c4,:e4,:c4,:e4,:c4,:e4,:c4],[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
    play_pattern_timed [:f4,:c4,:f4,:c4,:f4,:c4,:f4,:c4],[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
    play_pattern_timed [:f4,:c4,:f4,:c4,:f4,:c4,:f4,:c4],[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
  end
end

in_thread delay:96 do
  loop do
    gitargaochao
  end
end


in_thread delay:32 do
  24.times do
    drum
  end
end

in_thread delay:96 do
  loop do
    hi_hat
  end
end


in_thread delay:92 do
  1.times do
    maintojianzhoudrum
  end
end


in_thread do
  11.times do
    baseline
  end
  sleep 8
  11.times do
    baseline2
  end
end

##| in_thread delay:48 do
##|   4.times do
##|     baseline2
##|   end
##| end

##| in_thread do
##|   1.times do
##|     frontend
##|   end
##| end

##| in_thread

in_thread delay:64 do
  7.times do
    jianzhoudrum
  end
  sleep 4
  loop do
    jianzhoudrum
  end
end
