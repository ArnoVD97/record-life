//
//  MyLayout.m
//  New Style
//
//  Created by 翟旭博 on 2023/3/5.
//

#import "MyLayout.h"
@interface MyLayout ()
@property (nonatomic, assign) int itemCount;
@property (nonatomic, strong) NSMutableArray *attributeArray; // 自定义的配置数组
@end
@implementation MyLayout

//数组的相关设置在这个方法中
//布局前的准备 会调用这个方法
- (void)prepareLayout {
    [super prepareLayout];
    _itemCount = (int)[self.collectionView numberOfItemsInSection:0];
    _attributeArray = [[NSMutableArray alloc] init];
    
    //设置为静态的2列
    //计算每一个item的宽度
    float itemWidth = ([UIScreen mainScreen].bounds.size.width - self.sectionInset.left - self.sectionInset.right - self.minimumInteritemSpacing ) / 2;
    
    //定义数组保存每一列的高度
    //这个数组的主要作用是保存每一列的总高度，这个样在布局时，我们可以始终将下一个item放在最短的列下面
    CGFloat colHeight[2] = {self.sectionInset.top, self.sectionInset.bottom};
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentLeft;
    //itemCount是外界传进来的item的个数 遍历来设置每一个item的布局
    for (int i = 0; i < self.itemCount; i++) {
        
        //获取label高度
        label.text = self.dataArray[i][@"mainLabel"];
        double labelHeight = [label sizeThatFits:CGSizeMake(itemWidth - 10, CGFLOAT_MAX)].height;
        //图片高度
        UIImage *image = self.dataArray[i][@"mainImage"];
        double imageHeight = (itemWidth - 10) * image.size.height / image.size.width;
        
        //设置每一个item的位置等相关属性
        NSIndexPath *index = [NSIndexPath indexPathForItem:i inSection:0];
        //创建一个布局属性类， 通过indexPath来创建
        UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:index];
        //随意一个高度 在50-250之间
        CGFloat height = labelHeight + imageHeight + 40;
        //哪一行高度小 则放到哪一列下面
        //标记最短的列
        int flag = 0;
        if (colHeight[0] < colHeight[1]) {
            //将新的item高度加入到短的一列
            colHeight[0] = colHeight[0] + height + self.minimumLineSpacing;
            flag = 0;
        } else {
            colHeight[1] = colHeight[1] + height + self.minimumLineSpacing;
            flag = 1;
        }
        
        //设置item的位置
        if (flag == 0) {
            attris.frame = CGRectMake(self.sectionInset.left + (self.minimumInteritemSpacing + itemWidth) * flag, colHeight[flag] - height - self.minimumLineSpacing, itemWidth + 5, height);
        } else {
            attris.frame = CGRectMake(self.sectionInset.left + (self.minimumInteritemSpacing + itemWidth) * flag - 5, colHeight[flag] - height - self.minimumLineSpacing, itemWidth + 5, height);
        }
        [_attributeArray addObject:attris];
    }
        //设置itemSize来确保滑动范围的正确 这里是通过将所有的item高度平均化，计算出来的 （以最高的列为标准）
        if (colHeight[0] > colHeight[1]) {
            self.itemSize = CGSizeMake(itemWidth, (colHeight[0] - self.sectionInset.top) * 2 / _itemCount - self.minimumLineSpacing);
        } else {
            self.itemSize = CGSizeMake(itemWidth, (colHeight[1] - self.sectionInset.top) * 2 / _itemCount - self.minimumLineSpacing);
        }
}

//返回布局数组
- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return _attributeArray;
}
@end
