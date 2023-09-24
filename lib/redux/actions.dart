import 'package:bean_cellar/models/bean.sg.dart';

class UpdateBean {
  final String beanId;
  final Bean bean;

  UpdateBean(this.beanId, this.bean);
}

class UpdateBeanSubdivision {
  final String beanId;
  final String subdivisionId;
  final BeanSubdivision subdivision;

  UpdateBeanSubdivision(this.beanId, this.subdivisionId, this.subdivision);
}
