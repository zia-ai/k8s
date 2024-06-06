local config = import 'jsonnet/config.jsonnet';
local versions = ['1.27'];

config.new(
  name='gke',
  specs=[
    {
      output: std.join('.', std.split(version, '.')[:2]),
      prefix: '^io\\.gke\\..*',
      localName: 'gke',
      crds: [ './crds/%s.yaml' % version, ]
    } 
    for version in versions
  ]
) + {
  repository:: 'github.com/zia-ai/' + super.name + super.suffix,
}

