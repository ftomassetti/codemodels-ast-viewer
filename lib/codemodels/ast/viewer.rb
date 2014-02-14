require "codemodels/ast/viewer/version"

require 'java'

require 'jars/jgraphx.jar'

import java.awt.EventQueue
import javax.swing.JFrame
import java.lang.Runnable
import java.awt.Dimension
import javax.swing.JSplitPane
import javax.swing.JTextArea
import java.awt.Font
import java.awt.Color
#import com.mxgraph.swing.mxGraphComponent
#import com.mxgraph.view.mxGraph

include_class('com.mxgraph.swing.mxGraphComponent') {'MxGraphComponent'}
include_class('com.mxgraph.view.mxGraph') {'MxGraph'}

module Codemodels
  module Ast
    module Viewer

        class EditorFrame < JFrame

            def start
                self.title = "CodeModels AST-Viewer"
                self.size = Dimension.new 1000,700
                self.visible = true

                sp = JSplitPane.new JSplitPane::HORIZONTAL_SPLIT
                sp.setDividerLocation(0.5)
                self.content_pane.add sp

                ta = JTextArea.new
                ta.text = "Hello World!"
                font = Font.new("Verdana", Font::BOLD, 14)
                ta.setFont(font)
                ta.setForeground(Color::WHITE)
                ta.setBackground(Color::BLACK)

                sp.add ta
                sp.add(create_graph)
            end

            private

            def create_graph
              graph = MxGraph.new
              parent = graph.getDefaultParent

              graph.getModel.beginUpdate

              v1 = graph.insertVertex(parent, nil, "Hello", 20, 20, 80,
              30)
              v2 = graph.insertVertex(parent, nil, "World!", 240, 150,
              80, 30)
              graph.insertEdge(parent, nil, "Edge", v1, v2)
              graph.getModel.endUpdate

              graphComponent = MxGraphComponent.new(graph);
              graphComponent  
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
