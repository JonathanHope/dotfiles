(require '[zensols.nrpuget.core])

(->> {:print-color false
      :color-scheme {:keyword [:none]
                     :delimiter [:blue]
                     :number [:magenta]
                     :tag [:black]
                     :symbol [:red]
                     :string [:green]
                     :character [:bold :green]
                     :boolean [:black]
                     :nil [:black]}}
     zensols.nrpuget.core/set-options!)
