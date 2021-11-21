/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* top =  1  *)
(* src = "state_machine_synth.v:1" *)
module state_machine_synth(umbral_superior, umbral_inferior, State_est, clk, Umbral_bajo, Umbral_alto, reset, init, empty0, empty1, empty2, empty3, empty4, empty5, empty6, empty7);
  (* src = "state_machine_synth.v:17" *)
  wire [3:0] _000_;
  (* src = "state_machine_synth.v:17" *)
  wire [2:0] _001_;
  (* src = "state_machine_synth.v:17" *)
  wire [2:0] _002_;
  wire _003_;
  wire _004_;
  wire _005_;
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
  (* src = "state_machine_synth.v:10" *)
  wire [3:0] Estado;
  (* src = "state_machine_synth.v:3" *)
  output [3:0] State_est;
  (* src = "state_machine_synth.v:5" *)
  input [2:0] Umbral_alto;
  (* src = "state_machine_synth.v:5" *)
  input [2:0] Umbral_bajo;
  (* src = "state_machine_synth.v:4" *)
  input clk;
  (* src = "state_machine_synth.v:8" *)
  input empty0;
  (* src = "state_machine_synth.v:8" *)
  input empty1;
  (* src = "state_machine_synth.v:8" *)
  input empty2;
  (* src = "state_machine_synth.v:8" *)
  input empty3;
  (* src = "state_machine_synth.v:8" *)
  input empty4;
  (* src = "state_machine_synth.v:8" *)
  input empty5;
  (* src = "state_machine_synth.v:8" *)
  input empty6;
  (* src = "state_machine_synth.v:8" *)
  input empty7;
  (* src = "state_machine_synth.v:7" *)
  input init;
  (* src = "state_machine_synth.v:6" *)
  input reset;
  (* src = "state_machine_synth.v:2" *)
  output [2:0] umbral_inferior;
  (* src = "state_machine_synth.v:2" *)
  output [2:0] umbral_superior;
  NOT _071_ (
    .A(Estado[2]),
    .Y(_021_)
  );
  NOT _072_ (
    .A(Estado[1]),
    .Y(_022_)
  );
  NOT _073_ (
    .A(Estado[3]),
    .Y(_023_)
  );
  NOT _074_ (
    .A(init),
    .Y(_024_)
  );
  NOT _075_ (
    .A(umbral_superior[0]),
    .Y(_025_)
  );
  NOT _076_ (
    .A(umbral_superior[1]),
    .Y(_026_)
  );
  NOT _077_ (
    .A(umbral_superior[2]),
    .Y(_027_)
  );
  NOT _078_ (
    .A(umbral_inferior[0]),
    .Y(_028_)
  );
  NOT _079_ (
    .A(umbral_inferior[1]),
    .Y(_029_)
  );
  NOT _080_ (
    .A(umbral_inferior[2]),
    .Y(_030_)
  );
  NOR _081_ (
    .A(Estado[0]),
    .B(reset),
    .Y(_031_)
  );
  NOT _082_ (
    .A(_031_),
    .Y(State_est[0])
  );
  NOR _083_ (
    .A(_022_),
    .B(reset),
    .Y(State_est[1])
  );
  NOR _084_ (
    .A(_021_),
    .B(reset),
    .Y(State_est[2])
  );
  NOR _085_ (
    .A(_023_),
    .B(reset),
    .Y(State_est[3])
  );
  NOR _086_ (
    .A(Estado[2]),
    .B(Estado[3]),
    .Y(_032_)
  );
  NAND _087_ (
    .A(Estado[0]),
    .B(_032_),
    .Y(_033_)
  );
  NOR _088_ (
    .A(Estado[1]),
    .B(_033_),
    .Y(_034_)
  );
  NAND _089_ (
    .A(Estado[2]),
    .B(Estado[3]),
    .Y(_035_)
  );
  NOR _090_ (
    .A(Estado[0]),
    .B(Estado[1]),
    .Y(_036_)
  );
  NAND _091_ (
    .A(_035_),
    .B(_036_),
    .Y(_037_)
  );
  NOR _092_ (
    .A(_032_),
    .B(_037_),
    .Y(_038_)
  );
  NOR _093_ (
    .A(_034_),
    .B(_038_),
    .Y(_039_)
  );
  NAND _094_ (
    .A(Estado[0]),
    .B(_039_),
    .Y(_040_)
  );
  NOR _095_ (
    .A(Estado[0]),
    .B(_022_),
    .Y(_041_)
  );
  NAND _096_ (
    .A(_032_),
    .B(_041_),
    .Y(_042_)
  );
  NOR _097_ (
    .A(init),
    .B(_040_),
    .Y(_043_)
  );
  NOR _098_ (
    .A(reset),
    .B(_043_),
    .Y(_044_)
  );
  NOT _099_ (
    .A(_044_),
    .Y(_000_[0])
  );
  NOR _100_ (
    .A(_022_),
    .B(_032_),
    .Y(_045_)
  );
  NAND _101_ (
    .A(_024_),
    .B(_033_),
    .Y(_046_)
  );
  NOR _102_ (
    .A(_045_),
    .B(_046_),
    .Y(_047_)
  );
  NOR _103_ (
    .A(reset),
    .B(_047_),
    .Y(_000_[1])
  );
  NOR _104_ (
    .A(init),
    .B(reset),
    .Y(_048_)
  );
  NOT _105_ (
    .A(_048_),
    .Y(_049_)
  );
  NAND _106_ (
    .A(Estado[2]),
    .B(_039_),
    .Y(_050_)
  );
  NOT _107_ (
    .A(_050_),
    .Y(_051_)
  );
  NAND _108_ (
    .A(empty4),
    .B(empty5),
    .Y(_052_)
  );
  NAND _109_ (
    .A(empty6),
    .B(empty7),
    .Y(_053_)
  );
  NOR _110_ (
    .A(_052_),
    .B(_053_),
    .Y(_054_)
  );
  NAND _111_ (
    .A(empty0),
    .B(empty1),
    .Y(_055_)
  );
  NAND _112_ (
    .A(empty2),
    .B(empty3),
    .Y(_056_)
  );
  NOR _113_ (
    .A(_055_),
    .B(_056_),
    .Y(_057_)
  );
  NAND _114_ (
    .A(_054_),
    .B(_057_),
    .Y(_058_)
  );
  NOT _115_ (
    .A(_058_),
    .Y(_059_)
  );
  NAND _116_ (
    .A(_038_),
    .B(_059_),
    .Y(_060_)
  );
  NAND _117_ (
    .A(_042_),
    .B(_060_),
    .Y(_061_)
  );
  NOR _118_ (
    .A(_051_),
    .B(_061_),
    .Y(_062_)
  );
  NOR _119_ (
    .A(_049_),
    .B(_062_),
    .Y(_000_[2])
  );
  NOR _120_ (
    .A(Estado[3]),
    .B(_038_),
    .Y(_063_)
  );
  NAND _121_ (
    .A(_048_),
    .B(_060_),
    .Y(_064_)
  );
  NOR _122_ (
    .A(_063_),
    .B(_064_),
    .Y(_000_[3])
  );
  NAND _123_ (
    .A(init),
    .B(Umbral_bajo[0]),
    .Y(_065_)
  );
  NOT _124_ (
    .A(_065_),
    .Y(_066_)
  );
  NOR _125_ (
    .A(init),
    .B(_028_),
    .Y(_067_)
  );
  NOR _126_ (
    .A(_066_),
    .B(_067_),
    .Y(_068_)
  );
  NOR _127_ (
    .A(reset),
    .B(_068_),
    .Y(_001_[0])
  );
  NAND _128_ (
    .A(init),
    .B(Umbral_bajo[1]),
    .Y(_069_)
  );
  NOT _129_ (
    .A(_069_),
    .Y(_070_)
  );
  NOR _130_ (
    .A(init),
    .B(_029_),
    .Y(_003_)
  );
  NOR _131_ (
    .A(_070_),
    .B(_003_),
    .Y(_004_)
  );
  NOR _132_ (
    .A(reset),
    .B(_004_),
    .Y(_001_[1])
  );
  NAND _133_ (
    .A(init),
    .B(Umbral_bajo[2]),
    .Y(_005_)
  );
  NOT _134_ (
    .A(_005_),
    .Y(_006_)
  );
  NOR _135_ (
    .A(init),
    .B(_030_),
    .Y(_007_)
  );
  NOR _136_ (
    .A(_006_),
    .B(_007_),
    .Y(_008_)
  );
  NOR _137_ (
    .A(reset),
    .B(_008_),
    .Y(_001_[2])
  );
  NAND _138_ (
    .A(init),
    .B(Umbral_alto[0]),
    .Y(_009_)
  );
  NOT _139_ (
    .A(_009_),
    .Y(_010_)
  );
  NOR _140_ (
    .A(init),
    .B(_025_),
    .Y(_011_)
  );
  NOR _141_ (
    .A(_010_),
    .B(_011_),
    .Y(_012_)
  );
  NOR _142_ (
    .A(reset),
    .B(_012_),
    .Y(_002_[0])
  );
  NAND _143_ (
    .A(init),
    .B(Umbral_alto[1]),
    .Y(_013_)
  );
  NOT _144_ (
    .A(_013_),
    .Y(_014_)
  );
  NOR _145_ (
    .A(init),
    .B(_026_),
    .Y(_015_)
  );
  NOR _146_ (
    .A(_014_),
    .B(_015_),
    .Y(_016_)
  );
  NOR _147_ (
    .A(reset),
    .B(_016_),
    .Y(_002_[1])
  );
  NAND _148_ (
    .A(init),
    .B(Umbral_alto[2]),
    .Y(_017_)
  );
  NOT _149_ (
    .A(_017_),
    .Y(_018_)
  );
  NOR _150_ (
    .A(init),
    .B(_027_),
    .Y(_019_)
  );
  NOR _151_ (
    .A(_018_),
    .B(_019_),
    .Y(_020_)
  );
  NOR _152_ (
    .A(reset),
    .B(_020_),
    .Y(_002_[2])
  );
  (* src = "state_machine_synth.v:17" *)
  DFF _153_ (
    .C(clk),
    .D(_002_[0]),
    .Q(umbral_superior[0])
  );
  (* src = "state_machine_synth.v:17" *)
  DFF _154_ (
    .C(clk),
    .D(_002_[1]),
    .Q(umbral_superior[1])
  );
  (* src = "state_machine_synth.v:17" *)
  DFF _155_ (
    .C(clk),
    .D(_002_[2]),
    .Q(umbral_superior[2])
  );
  (* src = "state_machine_synth.v:17" *)
  DFF _156_ (
    .C(clk),
    .D(_001_[0]),
    .Q(umbral_inferior[0])
  );
  (* src = "state_machine_synth.v:17" *)
  DFF _157_ (
    .C(clk),
    .D(_001_[1]),
    .Q(umbral_inferior[1])
  );
  (* src = "state_machine_synth.v:17" *)
  DFF _158_ (
    .C(clk),
    .D(_001_[2]),
    .Q(umbral_inferior[2])
  );
  (* src = "state_machine_synth.v:17" *)
  DFF _159_ (
    .C(clk),
    .D(_000_[0]),
    .Q(Estado[0])
  );
  (* src = "state_machine_synth.v:17" *)
  DFF _160_ (
    .C(clk),
    .D(_000_[1]),
    .Q(Estado[1])
  );
  (* src = "state_machine_synth.v:17" *)
  DFF _161_ (
    .C(clk),
    .D(_000_[2]),
    .Q(Estado[2])
  );
  (* src = "state_machine_synth.v:17" *)
  DFF _162_ (
    .C(clk),
    .D(_000_[3]),
    .Q(Estado[3])
  );
endmodule
