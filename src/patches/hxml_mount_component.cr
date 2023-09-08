module Lucky::HXMLMountComponent
  def mount(component : Lucky::HXMLComponent.class, *args, **named_args, &) : Nil
    kwargs = named_args.merge(context: context)
    component.new(*args, **kwargs).tap do |instance|
      instance.xml = self.xml
      instance.render do |*yield_args|
        yield *yield_args
      end
    end
  end

  def mount(component : Lucky::HXMLComponent.class, *args, **named_args) : Nil
    kwargs = named_args.merge(context: context)
    component.new(*args, **kwargs).tap do |instance|
      instance.xml = self.xml
      instance.render
    end
  end
end
