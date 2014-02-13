require "codemodels/ast/viewer/version"

require 'java'

import java.awt.EventQueue
import javax.swing.JFrame
import java.lang.Runnable
import java.awt.Dimension
import javax.swing.JSplitPane
import javax.swing.JTextArea

module Codemodels
  module Ast
    module Viewer

        class EditorFrame < JFrame

            def start
                self.title = "CodeModels AST-Viewer"
                self.size = Dimension.new 1000,700
                self.visible = true

                sp = JSplitPane.new JSplitPane::HORIZONTAL_SPLIT
                self.content_pane.add sp

                ta = JTextArea.new
                sp.add ta
            end

        end

        class AppRunnable
          java_implements java.lang.Runnable
          java_signature 'void run()'
          def run
            p "running now."
            ef = EditorFrame.new
            ef.start
            p "done running."
          end
        end

      
        r = AppRunnable.new

        EventQueue.invokeLater(r)
    end
  end
end
