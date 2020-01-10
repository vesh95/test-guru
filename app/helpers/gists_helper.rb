module GistsHelper
  def hash(gist)
    gist.link_to.split('/')[-1]
  end
end
