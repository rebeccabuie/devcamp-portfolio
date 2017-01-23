module ApplicationHelper
  def copyright_generator
    BuieViewTool::Renderer.copyright 'Rebecca Buie', 'All Rights Reserved'
  end
end
