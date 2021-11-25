/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* dynports =  1  *)
(* top =  1  *)
(* src = "referee_1_str.v:3" *)
module referee_1_str(push_signal_str, pop_signal_str, data_out_str, almost_full_signal, almost_empty_signal, empty_f_signal, clk, state, data_in);
  (* src = "referee_1_str.v:31" *)
  wire [1:0] _000_;
  (* src = "referee_1_str.v:31" *)
  wire [3:0] _001_;
  (* src = "referee_1_str.v:31" *)
  wire [11:0] _002_;
  (* src = "referee_1_str.v:31" *)
  wire [3:0] _003_;
  (* src = "referee_1_str.v:31" *)
  wire _004_;
  (* src = "referee_1_str.v:31" *)
  wire [3:0] _005_;
  (* src = "referee_1_str.v:31" *)
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  wire _136_;
  wire _137_;
  wire _138_;
  wire _139_;
  wire _140_;
  wire _141_;
  wire _142_;
  wire _143_;
  wire _144_;
  wire _145_;
  wire _146_;
  wire _147_;
  wire _148_;
  wire _149_;
  wire _150_;
  wire _151_;
  wire _152_;
  wire _153_;
  wire _154_;
  wire _155_;
  wire _156_;
  wire _157_;
  wire _158_;
  wire _159_;
  wire _160_;
  wire _161_;
  wire _162_;
  wire _163_;
  wire _164_;
  wire _165_;
  wire _166_;
  wire _167_;
  wire _168_;
  wire _169_;
  wire _170_;
  wire _171_;
  wire _172_;
  wire _173_;
  wire _174_;
  wire _175_;
  wire _176_;
  wire _177_;
  wire _178_;
  (* src = "referee_1_str.v:15" *)
  input [3:0] almost_empty_signal;
  (* src = "referee_1_str.v:14" *)
  input [3:0] almost_full_signal;
  (* src = "referee_1_str.v:17" *)
  input clk;
  (* src = "referee_1_str.v:28" *)
  wire [1:0] counter;
  (* src = "referee_1_str.v:29" *)
  wire [3:0] counter_flag;
  (* src = "referee_1_str.v:19" *)
  input [11:0] data_in;
  (* src = "referee_1_str.v:13" *)
  output [11:0] data_out_str;
  (* src = "referee_1_str.v:16" *)
  input [3:0] empty_f_signal;
  (* src = "referee_1_str.v:12" *)
  output [3:0] pop_signal_str;
  (* src = "referee_1_str.v:27" *)
  wire pop_toggle;
  (* src = "referee_1_str.v:11" *)
  output [3:0] push_signal_str;
  (* src = "referee_1_str.v:27" *)
  wire push_toggle;
  (* src = "referee_1_str.v:18" *)
  input [3:0] state;
  NOT _179_ (
    .A(state[0]),
    .Y(_164_)
  );
  NOT _180_ (
    .A(counter[0]),
    .Y(_165_)
  );
  NOT _181_ (
    .A(counter[1]),
    .Y(_166_)
  );
  NOT _182_ (
    .A(data_in[9]),
    .Y(_167_)
  );
  NOT _183_ (
    .A(data_in[8]),
    .Y(_168_)
  );
  NOT _184_ (
    .A(empty_f_signal[1]),
    .Y(_169_)
  );
  NOT _185_ (
    .A(empty_f_signal[2]),
    .Y(_170_)
  );
  NOT _186_ (
    .A(empty_f_signal[3]),
    .Y(_171_)
  );
  NOT _187_ (
    .A(push_toggle),
    .Y(_172_)
  );
  NOT _188_ (
    .A(counter_flag[3]),
    .Y(_173_)
  );
  NOT _189_ (
    .A(counter_flag[1]),
    .Y(_174_)
  );
  NOT _190_ (
    .A(counter_flag[2]),
    .Y(_175_)
  );
  NOT _191_ (
    .A(data_in[0]),
    .Y(_176_)
  );
  NOT _192_ (
    .A(data_in[1]),
    .Y(_177_)
  );
  NOT _193_ (
    .A(data_in[2]),
    .Y(_178_)
  );
  NOT _194_ (
    .A(data_in[3]),
    .Y(_007_)
  );
  NOT _195_ (
    .A(data_in[4]),
    .Y(_008_)
  );
  NOT _196_ (
    .A(data_in[5]),
    .Y(_009_)
  );
  NOT _197_ (
    .A(data_in[6]),
    .Y(_010_)
  );
  NOT _198_ (
    .A(data_in[7]),
    .Y(_011_)
  );
  NOT _199_ (
    .A(data_in[10]),
    .Y(_012_)
  );
  NOT _200_ (
    .A(data_in[11]),
    .Y(_013_)
  );
  NOR _201_ (
    .A(state[1]),
    .B(state[2]),
    .Y(_014_)
  );
  NAND _202_ (
    .A(state[3]),
    .B(_014_),
    .Y(_015_)
  );
  NOR _203_ (
    .A(state[0]),
    .B(_015_),
    .Y(_016_)
  );
  NOR _204_ (
    .A(_172_),
    .B(pop_toggle),
    .Y(_017_)
  );
  NAND _205_ (
    .A(push_toggle),
    .B(_016_),
    .Y(_018_)
  );
  NOR _206_ (
    .A(pop_toggle),
    .B(_018_),
    .Y(_019_)
  );
  NAND _207_ (
    .A(_016_),
    .B(_017_),
    .Y(_020_)
  );
  NAND _208_ (
    .A(data_in[9]),
    .B(data_in[8]),
    .Y(_021_)
  );
  NOT _209_ (
    .A(_021_),
    .Y(_022_)
  );
  NOR _210_ (
    .A(push_signal_str[3]),
    .B(_022_),
    .Y(_023_)
  );
  NOR _211_ (
    .A(_020_),
    .B(_023_),
    .Y(_005_[3])
  );
  NOR _212_ (
    .A(data_in[9]),
    .B(data_in[8]),
    .Y(_024_)
  );
  NOR _213_ (
    .A(push_signal_str[0]),
    .B(_024_),
    .Y(_025_)
  );
  NAND _214_ (
    .A(_168_),
    .B(_019_),
    .Y(_026_)
  );
  NOR _215_ (
    .A(_020_),
    .B(_025_),
    .Y(_005_[0])
  );
  NOR _216_ (
    .A(empty_f_signal[3]),
    .B(counter_flag[3]),
    .Y(_027_)
  );
  NAND _217_ (
    .A(_171_),
    .B(_173_),
    .Y(_028_)
  );
  NOR _218_ (
    .A(almost_empty_signal[3]),
    .B(almost_empty_signal[2]),
    .Y(_029_)
  );
  NOT _219_ (
    .A(_029_),
    .Y(_030_)
  );
  NOR _220_ (
    .A(almost_empty_signal[1]),
    .B(almost_empty_signal[0]),
    .Y(_031_)
  );
  NOT _221_ (
    .A(_031_),
    .Y(_032_)
  );
  NOR _222_ (
    .A(_030_),
    .B(_032_),
    .Y(_033_)
  );
  NAND _223_ (
    .A(_029_),
    .B(_031_),
    .Y(_034_)
  );
  NOR _224_ (
    .A(_028_),
    .B(_034_),
    .Y(_035_)
  );
  NOR _225_ (
    .A(pop_signal_str[3]),
    .B(_035_),
    .Y(_036_)
  );
  NOR _226_ (
    .A(empty_f_signal[0]),
    .B(empty_f_signal[3]),
    .Y(_037_)
  );
  NOR _227_ (
    .A(almost_full_signal[2]),
    .B(almost_full_signal[1]),
    .Y(_038_)
  );
  NAND _228_ (
    .A(_037_),
    .B(_038_),
    .Y(_039_)
  );
  NOR _229_ (
    .A(empty_f_signal[1]),
    .B(empty_f_signal[2]),
    .Y(_040_)
  );
  NOR _230_ (
    .A(almost_full_signal[3]),
    .B(almost_full_signal[0]),
    .Y(_041_)
  );
  NAND _231_ (
    .A(_040_),
    .B(_041_),
    .Y(_042_)
  );
  NOR _232_ (
    .A(_039_),
    .B(_042_),
    .Y(_043_)
  );
  NAND _233_ (
    .A(_016_),
    .B(_043_),
    .Y(_044_)
  );
  NOR _234_ (
    .A(pop_toggle),
    .B(_044_),
    .Y(_045_)
  );
  NOT _235_ (
    .A(_045_),
    .Y(_046_)
  );
  NOR _236_ (
    .A(_033_),
    .B(_044_),
    .Y(_047_)
  );
  NOR _237_ (
    .A(_045_),
    .B(_047_),
    .Y(_048_)
  );
  NOR _238_ (
    .A(_036_),
    .B(_048_),
    .Y(_003_[3])
  );
  NOR _239_ (
    .A(data_in[9]),
    .B(_168_),
    .Y(_049_)
  );
  NOR _240_ (
    .A(push_signal_str[1]),
    .B(_049_),
    .Y(_050_)
  );
  NAND _241_ (
    .A(_167_),
    .B(_019_),
    .Y(_051_)
  );
  NOR _242_ (
    .A(_020_),
    .B(_050_),
    .Y(_005_[1])
  );
  NOR _243_ (
    .A(state[3]),
    .B(_164_),
    .Y(_052_)
  );
  NAND _244_ (
    .A(state[0]),
    .B(_014_),
    .Y(_053_)
  );
  NOR _245_ (
    .A(state[3]),
    .B(_053_),
    .Y(_054_)
  );
  NAND _246_ (
    .A(_014_),
    .B(_052_),
    .Y(_055_)
  );
  NAND _247_ (
    .A(counter_flag[0]),
    .B(_055_),
    .Y(_056_)
  );
  NOT _248_ (
    .A(_056_),
    .Y(_001_[0])
  );
  NOR _249_ (
    .A(_167_),
    .B(data_in[8]),
    .Y(_057_)
  );
  NOR _250_ (
    .A(push_signal_str[2]),
    .B(_057_),
    .Y(_058_)
  );
  NOR _251_ (
    .A(_020_),
    .B(_058_),
    .Y(_005_[2])
  );
  NAND _252_ (
    .A(_033_),
    .B(_045_),
    .Y(_059_)
  );
  NOT _253_ (
    .A(_059_),
    .Y(_060_)
  );
  NOR _254_ (
    .A(empty_f_signal[1]),
    .B(counter_flag[1]),
    .Y(_061_)
  );
  NAND _255_ (
    .A(_169_),
    .B(_174_),
    .Y(_062_)
  );
  NOR _256_ (
    .A(empty_f_signal[0]),
    .B(counter_flag[0]),
    .Y(_063_)
  );
  NOT _257_ (
    .A(_063_),
    .Y(_064_)
  );
  NAND _258_ (
    .A(_165_),
    .B(_166_),
    .Y(_065_)
  );
  NOR _259_ (
    .A(_064_),
    .B(_065_),
    .Y(_066_)
  );
  NOR _260_ (
    .A(empty_f_signal[2]),
    .B(counter_flag[2]),
    .Y(_067_)
  );
  NAND _261_ (
    .A(_170_),
    .B(_175_),
    .Y(_068_)
  );
  NAND _262_ (
    .A(_066_),
    .B(_068_),
    .Y(_069_)
  );
  NOR _263_ (
    .A(_061_),
    .B(_069_),
    .Y(_070_)
  );
  NAND _264_ (
    .A(_060_),
    .B(_070_),
    .Y(_071_)
  );
  NAND _265_ (
    .A(counter_flag[3]),
    .B(_071_),
    .Y(_072_)
  );
  NAND _266_ (
    .A(counter[0]),
    .B(_027_),
    .Y(_073_)
  );
  NOR _267_ (
    .A(_059_),
    .B(_073_),
    .Y(_074_)
  );
  NAND _268_ (
    .A(counter[1]),
    .B(_074_),
    .Y(_075_)
  );
  NAND _269_ (
    .A(_072_),
    .B(_075_),
    .Y(_076_)
  );
  NAND _270_ (
    .A(_055_),
    .B(_076_),
    .Y(_077_)
  );
  NOT _271_ (
    .A(_077_),
    .Y(_001_[3])
  );
  NAND _272_ (
    .A(_028_),
    .B(_060_),
    .Y(_078_)
  );
  NOR _273_ (
    .A(_069_),
    .B(_078_),
    .Y(_079_)
  );
  NOR _274_ (
    .A(_174_),
    .B(_079_),
    .Y(_080_)
  );
  NOR _275_ (
    .A(_165_),
    .B(counter[1]),
    .Y(_081_)
  );
  NAND _276_ (
    .A(counter[0]),
    .B(_166_),
    .Y(_082_)
  );
  NOR _277_ (
    .A(_027_),
    .B(_067_),
    .Y(_083_)
  );
  NAND _278_ (
    .A(_028_),
    .B(_068_),
    .Y(_084_)
  );
  NAND _279_ (
    .A(_033_),
    .B(_083_),
    .Y(_085_)
  );
  NOR _280_ (
    .A(_062_),
    .B(_085_),
    .Y(_086_)
  );
  NAND _281_ (
    .A(_081_),
    .B(_086_),
    .Y(_087_)
  );
  NOR _282_ (
    .A(_046_),
    .B(_087_),
    .Y(_088_)
  );
  NOR _283_ (
    .A(_080_),
    .B(_088_),
    .Y(_089_)
  );
  NOR _284_ (
    .A(_054_),
    .B(_089_),
    .Y(_001_[1])
  );
  NAND _285_ (
    .A(_062_),
    .B(_063_),
    .Y(_090_)
  );
  NOR _286_ (
    .A(_085_),
    .B(_090_),
    .Y(_091_)
  );
  NOR _287_ (
    .A(pop_signal_str[0]),
    .B(_091_),
    .Y(_092_)
  );
  NOR _288_ (
    .A(_048_),
    .B(_092_),
    .Y(_003_[0])
  );
  NAND _289_ (
    .A(_062_),
    .B(_066_),
    .Y(_093_)
  );
  NOR _290_ (
    .A(_078_),
    .B(_093_),
    .Y(_094_)
  );
  NOR _291_ (
    .A(_175_),
    .B(_094_),
    .Y(_095_)
  );
  NOR _292_ (
    .A(counter[0]),
    .B(_166_),
    .Y(_096_)
  );
  NAND _293_ (
    .A(_165_),
    .B(counter[1]),
    .Y(_097_)
  );
  NOR _294_ (
    .A(_027_),
    .B(_068_),
    .Y(_098_)
  );
  NOT _295_ (
    .A(_098_),
    .Y(_099_)
  );
  NOR _296_ (
    .A(_034_),
    .B(_099_),
    .Y(_100_)
  );
  NAND _297_ (
    .A(_096_),
    .B(_100_),
    .Y(_101_)
  );
  NOR _298_ (
    .A(_046_),
    .B(_101_),
    .Y(_102_)
  );
  NOR _299_ (
    .A(_095_),
    .B(_102_),
    .Y(_103_)
  );
  NOR _300_ (
    .A(_054_),
    .B(_103_),
    .Y(_001_[2])
  );
  NOR _301_ (
    .A(pop_signal_str[1]),
    .B(_086_),
    .Y(_104_)
  );
  NOR _302_ (
    .A(_048_),
    .B(_104_),
    .Y(_003_[1])
  );
  NAND _303_ (
    .A(counter[0]),
    .B(_059_),
    .Y(_105_)
  );
  NOT _304_ (
    .A(_105_),
    .Y(_106_)
  );
  NOR _305_ (
    .A(_061_),
    .B(_063_),
    .Y(_107_)
  );
  NAND _306_ (
    .A(counter[0]),
    .B(_107_),
    .Y(_108_)
  );
  NOT _307_ (
    .A(_108_),
    .Y(_109_)
  );
  NOR _308_ (
    .A(counter[0]),
    .B(_062_),
    .Y(_110_)
  );
  NOR _309_ (
    .A(_084_),
    .B(_110_),
    .Y(_111_)
  );
  NOR _310_ (
    .A(_059_),
    .B(_111_),
    .Y(_112_)
  );
  NOR _311_ (
    .A(_109_),
    .B(_112_),
    .Y(_113_)
  );
  NAND _312_ (
    .A(_065_),
    .B(_098_),
    .Y(_114_)
  );
  NAND _313_ (
    .A(_073_),
    .B(_114_),
    .Y(_115_)
  );
  NOR _314_ (
    .A(_113_),
    .B(_115_),
    .Y(_116_)
  );
  NOR _315_ (
    .A(_106_),
    .B(_116_),
    .Y(_117_)
  );
  NOR _316_ (
    .A(_054_),
    .B(_117_),
    .Y(_000_[0])
  );
  NOR _317_ (
    .A(_107_),
    .B(_110_),
    .Y(_118_)
  );
  NOR _318_ (
    .A(_084_),
    .B(_118_),
    .Y(_119_)
  );
  NOR _319_ (
    .A(_059_),
    .B(_119_),
    .Y(_120_)
  );
  NOR _320_ (
    .A(_166_),
    .B(_120_),
    .Y(_121_)
  );
  NOR _321_ (
    .A(_028_),
    .B(_097_),
    .Y(_122_)
  );
  NOR _322_ (
    .A(_082_),
    .B(_083_),
    .Y(_123_)
  );
  NOR _323_ (
    .A(_122_),
    .B(_123_),
    .Y(_124_)
  );
  NOR _324_ (
    .A(_059_),
    .B(_124_),
    .Y(_125_)
  );
  NOR _325_ (
    .A(_121_),
    .B(_125_),
    .Y(_126_)
  );
  NOR _326_ (
    .A(_054_),
    .B(_126_),
    .Y(_000_[1])
  );
  NOR _327_ (
    .A(pop_toggle),
    .B(_033_),
    .Y(_127_)
  );
  NOR _328_ (
    .A(_048_),
    .B(_127_),
    .Y(_004_)
  );
  NAND _329_ (
    .A(pop_toggle),
    .B(_016_),
    .Y(_128_)
  );
  NOT _330_ (
    .A(_128_),
    .Y(_006_)
  );
  NOR _331_ (
    .A(data_out_str[0]),
    .B(_019_),
    .Y(_129_)
  );
  NAND _332_ (
    .A(_176_),
    .B(_019_),
    .Y(_130_)
  );
  NAND _333_ (
    .A(_055_),
    .B(_130_),
    .Y(_131_)
  );
  NOR _334_ (
    .A(_129_),
    .B(_131_),
    .Y(_002_[0])
  );
  NOR _335_ (
    .A(data_out_str[1]),
    .B(_019_),
    .Y(_132_)
  );
  NAND _336_ (
    .A(_177_),
    .B(_019_),
    .Y(_133_)
  );
  NAND _337_ (
    .A(_055_),
    .B(_133_),
    .Y(_134_)
  );
  NOR _338_ (
    .A(_132_),
    .B(_134_),
    .Y(_002_[1])
  );
  NOR _339_ (
    .A(data_out_str[2]),
    .B(_019_),
    .Y(_135_)
  );
  NAND _340_ (
    .A(_178_),
    .B(_019_),
    .Y(_136_)
  );
  NAND _341_ (
    .A(_055_),
    .B(_136_),
    .Y(_137_)
  );
  NOR _342_ (
    .A(_135_),
    .B(_137_),
    .Y(_002_[2])
  );
  NOR _343_ (
    .A(data_out_str[3]),
    .B(_019_),
    .Y(_138_)
  );
  NAND _344_ (
    .A(_007_),
    .B(_019_),
    .Y(_139_)
  );
  NAND _345_ (
    .A(_055_),
    .B(_139_),
    .Y(_140_)
  );
  NOR _346_ (
    .A(_138_),
    .B(_140_),
    .Y(_002_[3])
  );
  NOR _347_ (
    .A(data_out_str[4]),
    .B(_019_),
    .Y(_141_)
  );
  NAND _348_ (
    .A(_008_),
    .B(_019_),
    .Y(_142_)
  );
  NAND _349_ (
    .A(_055_),
    .B(_142_),
    .Y(_143_)
  );
  NOR _350_ (
    .A(_141_),
    .B(_143_),
    .Y(_002_[4])
  );
  NOR _351_ (
    .A(data_out_str[5]),
    .B(_019_),
    .Y(_144_)
  );
  NAND _352_ (
    .A(_009_),
    .B(_019_),
    .Y(_145_)
  );
  NAND _353_ (
    .A(_055_),
    .B(_145_),
    .Y(_146_)
  );
  NOR _354_ (
    .A(_144_),
    .B(_146_),
    .Y(_002_[5])
  );
  NOR _355_ (
    .A(data_out_str[6]),
    .B(_019_),
    .Y(_147_)
  );
  NAND _356_ (
    .A(_010_),
    .B(_019_),
    .Y(_148_)
  );
  NAND _357_ (
    .A(_055_),
    .B(_148_),
    .Y(_149_)
  );
  NOR _358_ (
    .A(_147_),
    .B(_149_),
    .Y(_002_[6])
  );
  NOR _359_ (
    .A(data_out_str[7]),
    .B(_019_),
    .Y(_150_)
  );
  NAND _360_ (
    .A(_011_),
    .B(_019_),
    .Y(_151_)
  );
  NAND _361_ (
    .A(_055_),
    .B(_151_),
    .Y(_152_)
  );
  NOR _362_ (
    .A(_150_),
    .B(_152_),
    .Y(_002_[7])
  );
  NOR _363_ (
    .A(data_out_str[8]),
    .B(_019_),
    .Y(_153_)
  );
  NAND _364_ (
    .A(_026_),
    .B(_055_),
    .Y(_154_)
  );
  NOR _365_ (
    .A(_153_),
    .B(_154_),
    .Y(_002_[8])
  );
  NOR _366_ (
    .A(data_out_str[9]),
    .B(_019_),
    .Y(_155_)
  );
  NAND _367_ (
    .A(_051_),
    .B(_055_),
    .Y(_156_)
  );
  NOR _368_ (
    .A(_155_),
    .B(_156_),
    .Y(_002_[9])
  );
  NOR _369_ (
    .A(data_out_str[10]),
    .B(_019_),
    .Y(_157_)
  );
  NAND _370_ (
    .A(_012_),
    .B(_019_),
    .Y(_158_)
  );
  NAND _371_ (
    .A(_055_),
    .B(_158_),
    .Y(_159_)
  );
  NOR _372_ (
    .A(_157_),
    .B(_159_),
    .Y(_002_[10])
  );
  NOR _373_ (
    .A(data_out_str[11]),
    .B(_019_),
    .Y(_160_)
  );
  NAND _374_ (
    .A(_013_),
    .B(_019_),
    .Y(_161_)
  );
  NAND _375_ (
    .A(_055_),
    .B(_161_),
    .Y(_162_)
  );
  NOR _376_ (
    .A(_160_),
    .B(_162_),
    .Y(_002_[11])
  );
  NOR _377_ (
    .A(pop_signal_str[2]),
    .B(_100_),
    .Y(_163_)
  );
  NOR _378_ (
    .A(_048_),
    .B(_163_),
    .Y(_003_[2])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _379_ (
    .C(clk),
    .D(_005_[0]),
    .Q(push_signal_str[0])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _380_ (
    .C(clk),
    .D(_005_[1]),
    .Q(push_signal_str[1])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _381_ (
    .C(clk),
    .D(_005_[2]),
    .Q(push_signal_str[2])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _382_ (
    .C(clk),
    .D(_005_[3]),
    .Q(push_signal_str[3])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _383_ (
    .C(clk),
    .D(_003_[0]),
    .Q(pop_signal_str[0])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _384_ (
    .C(clk),
    .D(_003_[1]),
    .Q(pop_signal_str[1])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _385_ (
    .C(clk),
    .D(_003_[2]),
    .Q(pop_signal_str[2])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _386_ (
    .C(clk),
    .D(_003_[3]),
    .Q(pop_signal_str[3])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _387_ (
    .C(clk),
    .D(_002_[0]),
    .Q(data_out_str[0])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _388_ (
    .C(clk),
    .D(_002_[1]),
    .Q(data_out_str[1])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _389_ (
    .C(clk),
    .D(_002_[2]),
    .Q(data_out_str[2])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _390_ (
    .C(clk),
    .D(_002_[3]),
    .Q(data_out_str[3])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _391_ (
    .C(clk),
    .D(_002_[4]),
    .Q(data_out_str[4])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _392_ (
    .C(clk),
    .D(_002_[5]),
    .Q(data_out_str[5])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _393_ (
    .C(clk),
    .D(_002_[6]),
    .Q(data_out_str[6])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _394_ (
    .C(clk),
    .D(_002_[7]),
    .Q(data_out_str[7])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _395_ (
    .C(clk),
    .D(_002_[8]),
    .Q(data_out_str[8])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _396_ (
    .C(clk),
    .D(_002_[9]),
    .Q(data_out_str[9])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _397_ (
    .C(clk),
    .D(_002_[10]),
    .Q(data_out_str[10])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _398_ (
    .C(clk),
    .D(_002_[11]),
    .Q(data_out_str[11])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _399_ (
    .C(clk),
    .D(_006_),
    .Q(push_toggle)
  );
  (* src = "referee_1_str.v:31" *)
  DFF _400_ (
    .C(clk),
    .D(_004_),
    .Q(pop_toggle)
  );
  (* src = "referee_1_str.v:31" *)
  DFF _401_ (
    .C(clk),
    .D(_000_[0]),
    .Q(counter[0])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _402_ (
    .C(clk),
    .D(_000_[1]),
    .Q(counter[1])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _403_ (
    .C(clk),
    .D(_001_[0]),
    .Q(counter_flag[0])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _404_ (
    .C(clk),
    .D(_001_[1]),
    .Q(counter_flag[1])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _405_ (
    .C(clk),
    .D(_001_[2]),
    .Q(counter_flag[2])
  );
  (* src = "referee_1_str.v:31" *)
  DFF _406_ (
    .C(clk),
    .D(_001_[3]),
    .Q(counter_flag[3])
  );
endmodule
