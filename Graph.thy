theory Graph
imports Main "HOL-Library.Countable"
begin

text_raw \<open>\DefineSnippet{pre-graph}{\<close>
record ('v,'e,'l,'m) pre_graph =
  nodes  :: "'v set"
  edges  :: "'e set"
  source :: "'e \<Rightarrow> 'v"
  target :: "'e \<Rightarrow> 'v"
  node_label :: "'v \<Rightarrow> 'l"
  edge_label :: "'e \<Rightarrow> 'm"
text_raw \<open>}%EndSnippet\<close>

notation nodes  ("V\<^bsub>_\<^esub>")
notation edges  ("E\<^bsub>_\<^esub>")
notation source ("s\<^bsub>_\<^esub>")
notation target ("t\<^bsub>_\<^esub>")
notation node_label ("l\<^bsub>_\<^esub>")
notation edge_label ("m\<^bsub>_\<^esub>")

text_raw \<open>\DefineSnippet{locale-graph}{\<close>
locale graph =
  fixes G :: "('v::countable,'e::countable,'l,'m) pre_graph"
  assumes 
    finite_nodes: "finite V\<^bsub>G\<^esub>" and
    finite_edges: "finite E\<^bsub>G\<^esub>" and
    source_integrity: "e \<in> E\<^bsub>G\<^esub> \<Longrightarrow> s\<^bsub>G\<^esub> e \<in> V\<^bsub>G\<^esub>" and
    target_integrity: "e \<in> E\<^bsub>G\<^esub> \<Longrightarrow> t\<^bsub>G\<^esub> e \<in> V\<^bsub>G\<^esub>"
text_raw \<open>}%EndSnippet\<close>
end