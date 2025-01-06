import {
  campaignData,
  categoryData,
  userData,
  userRoleData,
  roleData,
} from '../../src/common/dummy';

import prisma from '../../src/common/db/prisma';

const load = async () => {
  try {
    // Delete existing data in tables
    await prisma.user.deleteMany();
    await prisma.role.deleteMany();
    await prisma.userRole.deleteMany();
    await prisma.category.deleteMany();
    await prisma.campaign.deleteMany();

    console.log('Deleted records in all related tables');

    // Reset sequences
    await prisma.$queryRaw`ALTER SEQUENCE "user_us_id_seq" RESTART WITH 1;`;
    await prisma.$queryRaw`ALTER SEQUENCE "role_rl_id_seq" RESTART WITH 1;`;
    await prisma.$queryRaw`ALTER SEQUENCE "userRole_ur_id_seq" RESTART WITH 1;`;
    await prisma.$queryRaw`ALTER SEQUENCE "campaign_cpn_id_seq" RESTART WITH 1;`;
    await prisma.$queryRaw`ALTER SEQUENCE "category_ct_id_seq" RESTART WITH 1;`;
    console.log('Reset ID sequences for all tables');

    // Insert new seed data
    await prisma.user.createMany({
      data: userData,
    });
    console.log('Added user data');

    await prisma.role.createMany({
      data: roleData,
    });
    console.log('Added role data');

    await prisma.category.createMany({
      data: categoryData,
    });
    console.log('Added category data');

    await prisma.userRole.createMany({
      data: userRoleData,
    });
    console.log('Added userRole data');

    await prisma.campaign.createMany({
      data: campaignData,
    });

    console.log('Added campaign data');

    // await Promise.all(
    //   campaignData.map(async (campaign) => {
    //     await prisma.campaign.create({
    //       data: {
    //         cpn_title: campaign.cpn_title,
    //         cpn_image: campaign.cpn_image,
    //         cpn_description: campaign.cpn_description,
    //         cpn_target_amount: campaign.cpn_target_amount,
    //         cpn_collected_amount: campaign.cpn_collected_amount,
    //         cpn_active: campaign.cpn_active,
    //         start_date: new Date(campaign.start_date),
    //         end_date: new Date(campaign.end_date),
    //         User: { connect: { us_id: campaign.user_id } },
    //         Category: { connect: { ct_id: campaign.category_id } },
    //       },
    //     });
    //   }),
    // );

    // console.log('Added campaign data');
  } catch (e) {
    console.error(e);
    process.exit(1);
  } finally {
    await prisma.$disconnect();
  }
};

load();
