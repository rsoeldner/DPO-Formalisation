theory ChurchRosser
  imports DirectDerivation
begin

text_raw \<open>\DefineSnippet{parallelindependence}{\<close>
locale parallel_independence =
  p\<^sub>1: direct_derivation r\<^sub>1 b\<^sub>1 b\<^sub>1' G g\<^sub>1 D\<^sub>1 m\<^sub>1 c\<^sub>1 H\<^sub>1 f\<^sub>1 h\<^sub>1 +
  p\<^sub>2: direct_derivation r\<^sub>2 b\<^sub>2 b\<^sub>2' G g\<^sub>2 D\<^sub>2 m\<^sub>2 c\<^sub>2 H\<^sub>2 f\<^sub>2 h\<^sub>2
  for r\<^sub>1 b\<^sub>1 b\<^sub>1' G g\<^sub>1 D\<^sub>1 m\<^sub>1 c\<^sub>1 H\<^sub>1 f\<^sub>1 h\<^sub>1 
      r\<^sub>2 b\<^sub>2 b\<^sub>2' g\<^sub>2 D\<^sub>2 m\<^sub>2 c\<^sub>2 H\<^sub>2 f\<^sub>2 h\<^sub>2 +
  assumes
    i: \<open>\<exists>i. morphism (lhs r\<^sub>1) D\<^sub>2 i 
            \<and> (\<forall>v \<in> V\<^bsub>lhs r\<^sub>1\<^esub>. \<^bsub>c\<^sub>2 \<circ>\<^sub>\<rightarrow> i\<^esub>\<^sub>V v = \<^bsub>g\<^sub>1\<^esub>\<^sub>V v) 
            \<and> (\<forall>e \<in> E\<^bsub>lhs r\<^sub>1\<^esub>. \<^bsub>c\<^sub>2 \<circ>\<^sub>\<rightarrow> i\<^esub>\<^sub>E e = \<^bsub>g\<^sub>1\<^esub>\<^sub>E e)\<close> and
    j: \<open>\<exists>j. morphism (lhs r\<^sub>2) D\<^sub>1 j 
            \<and> (\<forall>v \<in> V\<^bsub>lhs r\<^sub>2\<^esub>. \<^bsub>c\<^sub>1 \<circ>\<^sub>\<rightarrow> j\<^esub>\<^sub>V v = \<^bsub>g\<^sub>2\<^esub>\<^sub>V v) 
            \<and> (\<forall>e \<in> E\<^bsub>lhs r\<^sub>2\<^esub>. \<^bsub>c\<^sub>1 \<circ>\<^sub>\<rightarrow> j\<^esub>\<^sub>E e = \<^bsub>g\<^sub>2\<^esub>\<^sub>E e)\<close>
text_raw\<open>}%EndSnippet\<close>

text_raw \<open>\DefineSnippet{sequentialindependence}{\<close>
locale sequential_independence =
  p\<^sub>1: direct_derivation r\<^sub>1 b\<^sub>1 b\<^sub>1' G g\<^sub>1 D\<^sub>1 m\<^sub>1 c\<^sub>1 H\<^sub>1 f\<^sub>1 h\<^sub>1 +
  p\<^sub>2: direct_derivation r\<^sub>2 b\<^sub>2 b\<^sub>2' H\<^sub>1 g\<^sub>2 D\<^sub>2 m\<^sub>2 c\<^sub>2 H\<^sub>2 f\<^sub>2 h\<^sub>2
  for r\<^sub>1 b\<^sub>1 b\<^sub>1' G g\<^sub>1 D\<^sub>1 m\<^sub>1 c\<^sub>1 H\<^sub>1 f\<^sub>1 h\<^sub>1 
      r\<^sub>2 b\<^sub>2 b\<^sub>2' g\<^sub>2 D\<^sub>2 m\<^sub>2 c\<^sub>2 H\<^sub>2 f\<^sub>2 h\<^sub>2 +
  assumes
    i: \<open>\<exists>i. morphism (rhs r\<^sub>1) D\<^sub>2 i 
            \<and> (\<forall>v \<in> V\<^bsub>rhs r\<^sub>1\<^esub>. \<^bsub>c\<^sub>2 \<circ>\<^sub>\<rightarrow> i\<^esub>\<^sub>V v = \<^bsub>f\<^sub>1\<^esub>\<^sub>V v) 
            \<and> (\<forall>e \<in> E\<^bsub>rhs r\<^sub>1\<^esub>. \<^bsub>c\<^sub>2 \<circ>\<^sub>\<rightarrow> i\<^esub>\<^sub>E e = \<^bsub>f\<^sub>1\<^esub>\<^sub>E e)\<close> and
    j: \<open>\<exists>j. morphism (lhs r\<^sub>2) D\<^sub>1 j 
            \<and> (\<forall>v \<in> V\<^bsub>lhs r\<^sub>2\<^esub>. \<^bsub>h\<^sub>1 \<circ>\<^sub>\<rightarrow> j\<^esub>\<^sub>V v = \<^bsub>g\<^sub>2\<^esub>\<^sub>V v) 
            \<and> (\<forall>e \<in> E\<^bsub>lhs r\<^sub>2\<^esub>. \<^bsub>h\<^sub>1 \<circ>\<^sub>\<rightarrow> j\<^esub>\<^sub>E e = \<^bsub>g\<^sub>2\<^esub>\<^sub>E e)\<close> 
text_raw\<open>}%EndSnippet\<close>


text_raw \<open>\DefineSnippet{churchrosser}{\<close>
theorem (in parallel_independence) church_rosser:
  shows \<open>\<exists>g' D' m' c' H f' h' g'' D'' m'' c'' H f'' h''. 
         sequential_independence r\<^sub>1 b\<^sub>1 b\<^sub>1' G g\<^sub>1 D\<^sub>1 m\<^sub>1 c\<^sub>1 H\<^sub>1 f\<^sub>1 h\<^sub>1 
                                 r\<^sub>2 b\<^sub>2 b\<^sub>2' g' D' m' c' H f' h'
       \<and> sequential_independence r\<^sub>2 b\<^sub>2 b\<^sub>2' G g\<^sub>2 D\<^sub>2 m\<^sub>2 c\<^sub>2 H\<^sub>2 f\<^sub>2 h\<^sub>2 
                                 r\<^sub>1 b\<^sub>1 b\<^sub>1' g'' D'' m'' c'' H f'' h''\<close>
  text_raw\<open>}%EndSnippet\<close>
  sorry

theorem (in parallel_independence) church_rosser1:
  shows \<open>\<exists>(g' ::('o, 'm, 'p, 'n) pre_morph)
           (D' :: ('k \<times> 'u + 'e, 'l \<times> 'v + 'f, 'g, 'h) pre_graph) 
           (m':: ('q, 'k \<times> 'u + 'e, 'r, 'l \<times> 'v + 'f) pre_morph)
           (c':: ('k \<times> 'u + 'e, 'm, 'l \<times> 'v + 'f, 'n) pre_morph)
           (H :: (('k \<times> 'u + 's) + 'k \<times> 'u + 'e, ('l \<times> 'v + 't) + 'l \<times> 'v + 'f, 'g, 'h) pre_graph)
           (f':: ('s, ('k \<times> 'u + 's) + 'k \<times> 'u + 'e, 't, ('l \<times> 'v + 't) + 'l \<times> 'v + 'f) pre_morph)
            h' 
            (g'')
             (D'' ::('k \<times> 'u + 's, 'l \<times> 'v + 't, 'g, 'h) pre_graph)
              m'' c'' 
            (H :: (('k \<times> 'u + 's) + 'k \<times> 'u + 'e, ('l \<times> 'v + 't) + 'l \<times> 'v + 'f, 'g, 'h) pre_graph)
             f'' h''. 
                  sequential_independence r\<^sub>1 b\<^sub>1 b\<^sub>1' G g\<^sub>1 D\<^sub>1 m\<^sub>1 c\<^sub>1 H\<^sub>1 f\<^sub>1 h\<^sub>1 r\<^sub>2 b\<^sub>2 b\<^sub>2' g' D' m' c' H f' h'
                \<and> sequential_independence r\<^sub>2 b\<^sub>2 b\<^sub>2' G g\<^sub>2 D\<^sub>2 m\<^sub>2 c\<^sub>2 H\<^sub>2 f\<^sub>2 h\<^sub>2 r\<^sub>1 b\<^sub>1 b\<^sub>1' g'' D'' m'' c'' H f'' h''\<close>
proof -

  have \<open>\<exists>xx. morphism D\<^sub>1 G xx\<close>
    sledgehammer
    using p\<^sub>1.po1.g.morphism_axioms by blast

  interpret "22": pullback_construction D\<^sub>1 G D\<^sub>2 c\<^sub>1 c\<^sub>2 ..

  interpret 